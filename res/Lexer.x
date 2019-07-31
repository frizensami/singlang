{
module Lexer (main, scanTokens) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-  
  $white+				;
  "--".*				;
  chope					{ \s -> TChope }
  "confirm plus chop" { \s -> TConst }
  "meh?"        { \s -> TIf }
  "ok den"      { \s -> TThen }
  "alamak den"  { \s -> TElse }
  "wait long long," { \s -> TWhile }
  paiseh        { \s -> TThrow }
  $digit+				{ \s -> TInt (read s) }
  \".*\"        { \s -> TLit s }
  [\=\+\-\*\/\(\)]			{ \s -> TSym (head s) }
  $alpha [$alpha $digit \_ \']*		{ \s -> TVar s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
  TChope     |
  TConst     |
  TIf        |
  TThen      |
  TElse      |
  TWhile     |
  TThrow     |
  TLit String |
  TSym Char  |
  TVar String  |
  TInt Int
  deriving (Eq,Show)

scanTokens = alexScanTokens

main = do
  s <- getContents
  print (alexScanTokens s)
}