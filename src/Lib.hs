module Lib
    ( interpret
    ) where

import qualified Lexer
import qualified Parser

printParseTree :: [Parser.Exp] -> IO ()
printParseTree [] = return ()
printParseTree (exp:exps) = do
    print exp
    printParseTree exps

interpret :: IO ()
interpret = do
    code <- getContents
    let 
        tokens = Lexer.scanTokens code
        -- Need to reverse the parsed tree due to left recursion on expressions
        parseTree = reverse $ Parser.parseTokens tokens
    printParseTree parseTree
