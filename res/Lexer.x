{
module Lexer (main, scanTokens, Token (..)) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-  
  $white+				;
  "--".*				;
  chope					{ \s -> TLet }
  "confirm plus chop" { \s -> TConst }
  "meh?"        { \s -> TIf }
  "ok den"      { \s -> TThen }
  "alamak den"  { \s -> TElse }
  "wait long long," { \s -> TWhile }
  "ok can liao"      { \s -> TEndBlock }
  paiseh        { \s -> TThrow }
  simi          { \s -> TPrint }
  $digit+				{ \s -> TInt (read s) }
  \".*\"        { \s -> TLit s }
  \=            { \s -> TEq }
  \+            { \s -> TPlus }
  \-            { \s -> TMinus }
  \*            { \s -> TTimes }
  \/            { \s -> TDiv }
  \(            { \s -> TLParen }
  \)            { \s -> TRParen }
  \<            { \s -> TLArrow }
  \>            { \s -> TRArrow }
  \<=            { \s -> TLEArrow }
  \>=            { \s -> TREArrow }
  \!=            { \s -> TNeq }
  $alpha [$alpha $digit \_ \']*		{ \s -> TVar s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
  TLet     |
  TConst     |
  TIf        |
  TThen      |
  TElse      |
  TWhile     |
  TEndBlock     |
  TThrow     |
  TPrint     |
  TLit String |
  TEq |
  TPlus |
  TMinus |
  TTimes |
  TDiv |
  TLParen |
  TRParen |
  TLArrow |
  TRArrow |
  TLEArrow |
  TREArrow |
  TNeq |
  TVar String  |
  TInt Int
  deriving (Eq,Show)

scanTokens = alexScanTokens

main = do
  s <- getContents
  print (alexScanTokens s)
}