module Lib
    ( interpret
    ) where

import qualified Lexer

interpret :: IO ()
interpret = do
    code <- getContents
    print (Lexer.scanTokens code)
