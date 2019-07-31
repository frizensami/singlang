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
    while { TWhile }
    throw { TThrow }
    str { TLit $$ }
    sym { TSym $$ }
    var { TVar $$ }
    int { TInt $$ }


%%

Exp : let var sym Exp { Let $2 $4 } 
    | int { Int $1 }
    | str { Str $1 }
    | var { Var $1 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exp = Let String Exp
         | Int Int
         | Str String
         | Var String
         deriving Show
}