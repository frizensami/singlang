module Lib
    ( interpret
    ) where

import qualified Lexer
import qualified Parser

interpret :: IO ()
interpret = do
    code <- getContents
    let 
        tokens = Lexer.scanTokens code
        -- Need to reverse the parsed tree due to left recursion on expressions
        parseTree = reverse $ Parser.parseTokens tokens
    print parseTree
