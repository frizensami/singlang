import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "Tokenizer" $ do
        it "does the thing" $ do
            1 `shouldBe` 1