module LexerSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lexer

spec :: Spec
spec = do
    describe "Lexer" $ do
        it "should lex simple let stmts" $
            let 
                tokens = scanTokens "chope x = 5"
            in 
                tokens `shouldBe` [TLet, TVar "x", TEq, TInt 5]