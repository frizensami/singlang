module Evaluator
    ( eval
    ) where

import Parser
import qualified Data.HashMap.Strict as Map

data ProgramVal = StringVal String | IntVal Int
instance Show ProgramVal where
    show (StringVal str) = str
    show (IntVal int) = show int
data ProgramState = ProgramState { variables :: Map.HashMap String ProgramVal }

newProgramState :: ProgramState
newProgramState = ProgramState Map.empty

eval :: [Exp] -> IO ()
eval exps = do 
    evalAll exps newProgramState
    return ()

evalAll :: [Exp] -> ProgramState -> IO ProgramState
evalAll [] state = return state 
evalAll (exp:exps) state = do
    (val, state) <- evalOne exp state
    evalAll exps state

evalOne :: Exp -> ProgramState -> IO (ProgramVal, ProgramState)
{- 
evalOne (Let str exp) state = do
    return (val, newState)
        where 
            oldState = variables state
            (val, throwawaystate) = evalOne
            newState = HashMap.insert str (evalOne exp)
-}

evalOne (Plus exp1 exp2) state = do
    (IntVal val1, _) <- evalOne exp1 state
    (IntVal val2, _) <- evalOne exp2 state
    return (IntVal (val1 + val2), state)

evalOne (Minus exp1 exp2) state = do
    (IntVal val1, _) <- evalOne exp1 state
    (IntVal val2, _) <- evalOne exp2 state
    return (IntVal (val1 - val2), state)

evalOne (Print exp) state = do
    (val, _) <- evalOne exp state
    print val
    return (StringVal (show val), state)

evalOne (Int val) state = return (IntVal val, state)
evalOne (Str val) state = return (StringVal val, state)

evalOne exp _ = error $ "Cannot parse " ++ show exp


