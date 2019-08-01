module Evaluator
    ( eval
    ) where

import Parser
import qualified Data.HashMap.Strict as Map

data ProgramVal = StringVal String | IntVal Int
instance Show ProgramVal where
    show (StringVal str) = str
    show (IntVal int) = show int
data ProgramState = ProgramState { progvariables :: Map.HashMap String ProgramVal
                                 , progconstants :: Map.HashMap String ProgramVal }
                    deriving Show

eval :: [Exp] -> IO ()
eval exps = do 
    (_, state) <- evalAll exps newProgramState
    print state
    return ()

newProgramState :: ProgramState
newProgramState = ProgramState Map.empty Map.empty

updateVariable :: ProgramState -> String -> ProgramVal -> ProgramState
updateVariable oldstate str val = 
    let 
        oldvars = progvariables oldstate
    in oldstate { progvariables = Map.insert str val oldvars }

deleteVariable :: ProgramState -> String -> ProgramState
deleteVariable oldstate str = 
    let 
        oldvars = progvariables oldstate
    in oldstate { progvariables = Map.delete str oldvars }

updateConst :: ProgramState -> String -> ProgramVal -> ProgramState
updateConst oldstate str val = 
    let 
        oldconsts = progconstants oldstate
    in oldstate { progconstants = Map.insert str val oldconsts }

evalAll :: [Exp] -> ProgramState -> IO (ProgramVal, ProgramState)
evalAll [] state = return (StringVal "", state)
evalAll (exp:exps) state = do
    (val, state) <- evalOne exp state
    evalAll exps state

evalOne :: Exp -> ProgramState -> IO (ProgramVal, ProgramState)
evalOne (Let str exp) state =
    -- Do not allow let expressions to override things that are marked const
    if Map.member str (progconstants state)
        then error $ "ERROR: Redefinition of constant " ++ str
    else do
        (evalVal, _) <- evalOne exp state
        return (evalVal, updateVariable state str evalVal)

evalOne (Const str exp) state = do
    -- Check for shadowing and erase var if const shadows it
    (evalVal, _) <- evalOne exp state
    if Map.member str (progvariables state)
        then 
            let 
                newstate = deleteVariable state str
            in 
                return (evalVal, updateConst newstate str evalVal)
        else return (evalVal, updateConst state str evalVal)

evalOne (Var str) state =
    -- Do not allow let expressions to override things that are marked const
    case Map.lookup str (progvariables state) of
        (Just val) -> return (val, state)
        Nothing -> 
            case Map.lookup str (progconstants state) of
                (Just val) -> return (val, state)
                Nothing -> error $ "var/const " ++ str ++ " not defined!"

evalOne (IfThenElse cmp exps1 exps2) state = do
    compareResult <- evalCmp cmp state
    if compareResult
        then do 
            (val, state) <- evalAll exps1 state
            return (val, state)
        else do
            (val, state) <- evalAll exps2 state
            return (val, state)

evalOne (Plus exp1 exp2) state = do
    (IntVal val1, _) <- evalOne exp1 state
    (IntVal val2, _) <- evalOne exp2 state
    return (IntVal (val1 + val2), state)

evalOne (Minus exp1 exp2) state = do
    (IntVal val1, _) <- evalOne exp1 state
    (IntVal val2, _) <- evalOne exp2 state
    return (IntVal (val1 - val2), state)

evalOne (Times exp1 exp2) state = do
    (IntVal val1, _) <- evalOne exp1 state
    (IntVal val2, _) <- evalOne exp2 state
    return (IntVal (val1 * val2), state)

evalOne (Div exp1 exp2) state = do
    (IntVal val1, _) <- evalOne exp1 state
    (IntVal val2, _) <- evalOne exp2 state
    return (IntVal (val1 `div` val2), state)

evalOne (Negate exp) state = do
    (IntVal val, _) <- evalOne exp state
    return (IntVal (negate val), state)

evalOne (Print exp) state = do
    (val, _) <- evalOne exp state
    print val
    return (StringVal (show val), state)

evalOne (Int val) state = return (IntVal val, state)
evalOne (Str val) state = return (StringVal val, state)

evalOne exp _ = error $ "Cannot parse " ++ show exp


evalCmp :: Cmp -> ProgramState -> IO Bool
evalCmp (CmpEq exp1 exp2) state = do
    (val1, _) <- evalOne exp1 state
    (val2, _) <- evalOne exp2 state
    return (compareProgramVal val1 val2 == EQ)

compareProgramVal :: ProgramVal -> ProgramVal  -> Ordering
compareProgramVal (IntVal v1) (IntVal v2) = compare v1 v2
compareProgramVal (StringVal v1) (StringVal v2) = compare v1 v2
compareProgramVal v1 v2 = error $ "Cannot compare values " ++ show v1 ++ " and " ++ show v2

