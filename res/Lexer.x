{
module Lexer (main, scanTokens) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-  
  $white+				;
  "--".*				;
  chope					{ \s -> Chope }
  "confirm plus chop" { \s -> Const }
  "meh?"        { \s -> If }
  "ok den"      { \s -> Then }
  "alamak den"  { \s -> Else }
  "wait long long," { \s -> While }
  paiseh        { \s -> Throw }
  $digit+				{ \s -> Int (read s) }
  \".*\"        { \s -> Lit s }
  [\=\+\-\*\/\(\)]			{ \s -> Sym (head s) }
  $alpha [$alpha $digit \_ \']*		{ \s -> Var s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
  Chope     |
  Const     |
  If        |
  Then      |
  Else      |
  While     |
  Throw     |
  Lit String |
  Sym Char  |
  Var String  |
  Int Int
  deriving (Eq,Show)

scanTokens = alexScanTokens

main = do
  s <- getContents
  print (alexScanTokens s)
}