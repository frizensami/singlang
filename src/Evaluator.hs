module Evaluator
    ( eval
    ) where

import Parser

data ProgramState = ProgramState { variables :: [Int] }

eval :: [Exp] -> IO ()
eval exps = do 
    evalAll exps (ProgramState [])
    return ()

evalAll :: [Exp] -> ProgramState -> IO ProgramState
evalAll [] state = return state 
evalAll (exp:exps) state = do
    state <- evalOne exp state
    evalAll exps state

evalOne :: Exp -> ProgramState -> IO ProgramState
evalOne exp state = do 
    print exp
    return state


