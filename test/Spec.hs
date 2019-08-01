import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lexer
import Parser

main :: IO ()
main = hspec $ do
    describe "Lexer" $ do
        it "should parse simple let stmts" $
            let 
                tokens = scanTokens "chope x = 5"
            in 
                tokens `shouldBe` [TLet, TVar "x", TEq, TInt 5]

    describe "Parser" $ do
        it "should parse simple let stmts" $
            let 
                stmts = parseTokens $ scanTokens "chope x = 5"
            in
                stmts `shouldBe` [Let "x" (Int 5)]