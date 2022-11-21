{
module Lexer (lexermain, scanTokens, Token (..)) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-  
  $white+				;
  "--".*				;
  "ok uncle tell you story ah..." {\s -> TProgStart}
  "ok uncle finish liao" {\s -> TProgEnd}
  chope					{ \s -> TLet }
  "confirm plus chop" { \s -> TConst }
  "meh?"        { \s -> TIf }
  "ok den"      { \s -> TThen }
  "alamak den"  { \s -> TElse }
  "wait long long," { \s -> TWhile }
  "ok can liao"      { \s -> TEndBlock }
  paiseh        { \s -> TThrow }
  simi          { \s -> TPrint }
  makan         { \s -> TRead }
  $digit+				{ \s -> TInt (read s) }
  \".*\"        { \s -> TLit s }
  "is"            { \s -> TEqCmp }
  "as"            { \s -> TEq }
  \+            { \s -> TPlus }
  \-            { \s -> TMinus }
  "POFMA"       { \s -> TMinus }
  \*            { \s -> TTimes }
  \/            { \s -> TDiv }
  \(            { \s -> TLParen }
  \)            { \s -> TRParen }
  \<            { \s -> TLArrow }
  \>            { \s -> TRArrow }
  \<=            { \s -> TLEArrow }
  \>=            { \s -> TREArrow }
  "not"            { \s -> TNeq }
  $alpha [$alpha $digit \_ \']*		{ \s -> TVar s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
  TProgStart |
  TProgEnd   |
  TLet     |
  TConst     |
  TIf        |
  TThen      |
  TElse      |
  TWhile     |
  TEndBlock     |
  TThrow     |
  TPrint     |
  TRead     |
  TLit String |
  TEq |
  TEqCmp |
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
  deriving (Eq, Show)

scanTokens = alexScanTokens

lexermain = do
  s <- getContents
  print (alexScanTokens s)
}
