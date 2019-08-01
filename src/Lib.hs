module Lib
    ( interpret
    ) where

import qualified Lexer
import qualified Parser
import qualified Evaluator

printExpressions :: [Parser.Exp] -> IO ()
printExpressions [] = return ()
printExpressions (exp:exps) = do
    print exp
    printExpressions exps

interpret :: IO ()
interpret = do
    code <- getContents
    let 
        tokens = Lexer.scanTokens code
        -- Need to reverse the parsed tree due to left recursion on expressions
        expressions = reverse $ Parser.parseTokens tokens
    putStr "\n--Parsed Statement List--\n\n"
    printExpressions expressions
    putStr "\n--End Parsed Statement List--\n"
    Evaluator.eval expressions

