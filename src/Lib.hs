module Lib
    ( someFunc
    ) where

import Text.Parsec.String (Parser)
import Text.Parsec.Language (emptyDef)
import qualified Text.Parsec.Token as Tok


someFunc :: IO ()
someFunc = putStrLn "EXECUTED"
