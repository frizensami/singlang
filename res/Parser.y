{
module Parser where
import Lexer
}

%name parseTokens
%tokentype { Token }
%error { parseError }

%token
    let { TLet }
    const { TConst }
    if { TIf }
    then { TThen }
    else { TElse }
    while { TWhile }
    end { TEndBlock }
    throw { TThrow }
    print { TPrint }
    read { TRead }
    str { TLit $$ }
    var { TVar $$ }
    int { TInt $$ }
    ':=' { TEqCmp }
    '=' { TEq }
    '+' { TPlus }
    '-' { TMinus }
    '*' { TTimes }
    '/' { TDiv }
    '(' { TLParen }
    ')' { TRParen }
    '<' { TLArrow }
    '>' { TRArrow }
    '<=' { TLEArrow }
    '>=' { TREArrow }
    '!=' { TNeq }

%left '+' '-'
%left '*' '/'
%left NEG

%%

-- Left recursive: list of expressions
Exps : Exp { [$1] }
     | Exps Exp { $2 : $1 }

Exp : let var '=' Exp       { Let $2 $4 } 
    | const var ':=' Exp    { Const $2 $4 }
    | Exp '+' Exp           { Plus $1 $3 }
    | Exp '-' Exp           { Minus $1 $3 }
    | Exp '*' Exp           { Times $1 $3 }
    | Exp '/' Exp           { Div $1 $3 }
    | while Cmp if Exps end { While $2 $4 }
    | Cmp if then Exps else Exps end { IfThenElse $1 $4 $6 }
    | '(' Exp ')'           { $2 }
    | '-' Exp %prec NEG     { Negate $2 }
    | throw str             { Throw $2 }
    | print Exp             { Print $2 }
    | read                  { Read }
    | int                   { Int $1 }
    | str                   { Str $1 }
    | var                   { Var $1 }

Cmp : Exp ':=' Exp { CmpEq $1 $3 }
    | Exp '>' Exp { CmpGT $1 $3 }
    | Exp '<' Exp { CmpLT $1 $3 }
    | Exp '>=' Exp { CmpGTE $1 $3 }
    | Exp '<=' Exp { CmpLTE $1 $3 }
    | Exp '!=' Exp { CmpNeq $1 $3 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exps = Exps [Exp] deriving (Show, Eq)

data Exp = Let String Exp
         | Const String Exp
         | Plus Exp Exp
         | Minus Exp Exp
         | Times Exp Exp
         | Div Exp Exp
         | IfThenElse Cmp [Exp] [Exp]
         | While Cmp [Exp]
         | Negate Exp
         | Brack Exp
         | Throw String
         | Print Exp
         | Read
         | Int Int
         | Str String
         | Var String
         deriving (Show, Eq)

data Cmp = CmpEq Exp Exp 
         | CmpGT Exp Exp 
         | CmpLT Exp Exp 
         | CmpGTE Exp Exp 
         | CmpLTE Exp Exp 
         | CmpNeq Exp Exp 
         deriving (Show, Eq)

}