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
        parseTree = Parser.parseTokens tokens
    print parseTree
