module Lib
    ( interpret
    ) where

import qualified Lexer
import qualified Parser
import qualified Evaluator

import System.Environment
import System.IO
import Control.Monad (when)
import Defs (Verbosity (..))

{- |
    Entry point from main, parses arguments and calls
    main interpretation function.
-}
interpret :: IO ()
interpret = do
    filepath <- getArgs
    case filepath of 
        -- 1-argument mode, just file path
        [filepath] -> withFile filepath ReadMode (startInterpret Normal)
        -- 2-argument mode - optional verbosity
        [filepath, "-v"] -> withFile filepath ReadMode (startInterpret Verbose)
        -- Error condition fallthrough for incorrect args
        _ -> putStrLn "Argument format incorrect, expecting singlang-exe <filepath> [-v]"

{- |
    Does syntax and semantic processing, and calls the interpreter (.eval) after.
-}   
startInterpret :: Verbosity -> Handle -> IO ()
startInterpret verbosity handle = do  
    -- Get code file contents 
    code <- hGetContents handle     

    -- Print code file contents if verbose
    when (verbosity == Verbose) $ do
        putStr "\n---- Start Code ----\n\n"
        putStr code
        putStr "\n---- End Code ----\n"

    -- Run lexer and parser
    let 
        tokens = Lexer.scanTokens code
        -- Need to reverse the parsed tree due to left recursion on expressions
        expressions = reverse $ Parser.parseTokens tokens

    -- Print parsed code if verbose
    when (verbosity == Verbose) $ do
        putStr "\n---- Parsed Statement List ----\n\n"
        printExpressions expressions
        putStr "\n---- End Parsed Statement List ----\n"


    -- Evaluate parse tree (actually interpret code)
    Evaluator.eval verbosity expressions

{- |
    Helper function to print each expression
    Pretty sure there is a more idiomatic way (foldM? mapM?) 
-}   
printExpressions :: [Parser.Exp] -> IO ()
printExpressions [] = return ()
printExpressions (exp:exps) = do
    print exp
    printExpressions exps



    

