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
    state <- evalAll exps newProgramState
    print state
    return ()

newProgramState :: ProgramState
newProgramState = ProgramState Map.empty Map.empty

updateVariable :: ProgramState -> String -> ProgramVal -> ProgramState
updateVariable oldstate str val = 
    let 
        oldvars = progvariables oldstate
    in oldstate { progvariables = Map.insert str val oldvars}

evalAll :: [Exp] -> ProgramState -> IO ProgramState
evalAll [] state = return state 
evalAll (exp:exps) state = do
    (val, state) <- evalOne exp state
    evalAll exps state

evalOne :: Exp -> ProgramState -> IO (ProgramVal, ProgramState)
evalOne (Let str exp) state = do
    (evalVal, _) <- evalOne exp state
    return (evalVal, updateVariable state str evalVal)

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


