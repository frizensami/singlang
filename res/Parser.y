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
    str { TLit $$ }
    var { TVar $$ }
    int { TInt $$ }
    '=' { TEq }
    '+' { TPlus }
    '-' { TMinus }
    '*' { TTimes }
    '/' { TDiv }
    '(' { TLParen }
    ')' { TRParen }

%left '+' '-'
%left '*' '/'
%left NEG

%%

-- Left recursive: list of expressions
Exps : Exp { [$1] }
     | Exps Exp { $2 : $1 }

Exp : let var '=' Exp       { Let $2 $4 } 
    | const var '=' Exp     { Const $2 $4 }
    | Exp '+' Exp           { Plus $1 $3 }
    | Exp '-' Exp           { Minus $1 $3 }
    | Exp '*' Exp           { Times $1 $3 }
    | Exp '/' Exp           { Div $1 $3 }
    | while Cmp if Exps end { While $2 $4 }
    | Cmp if then Exps else Exps end { IfThenElse $1 $4 $6 }
    | '(' Exp ')'           { $2 }
    | '-' Exp %prec NEG     { Negate $2 }
    | print Exp             { Print $2 }
    | int                   { Int $1 }
    | str                   { Str $1 }
    | var                   { Var $1 }

Cmp : Exp '=' Exp { CmpEq $1 $3 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exps = Exps [Exp] deriving Show

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
         | Print Exp
         | Int Int
         | Str String
         | Var String
         deriving Show

data Cmp = CmpEq Exp Exp deriving Show

}