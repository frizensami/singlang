module ParserSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lexer
import Parser

spec :: Spec
spec = do
    describe "Parser" $ do
        it "should parse simple let stmts" $
            let 
                stmts = parseTokens [TLet, TVar "x", TEq, TInt 5]
            in
                stmts `shouldBe` [Let "x" (Int 5)]