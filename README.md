# Singlang v2: Now Uncle also can code

<!-- TOC depthFrom:2 depthTo:4 -->

- [Why leh](#why-leh)
- [Simi *Singlang*?](#simi-singlang)
- [Uncle i still dun understand](#uncle-i-still-dun-understand)
    - [The Key Words liddat](#the-key-words-liddat)
    - [Den the Operators liddat](#den-the-operators-liddat)
- [Uncle I want to try!](#uncle-i-want-to-try)
- [Uncle I want more Singlang!](#uncle-i-want-more-singlang)
- [How to help you Uncle?](#how-to-help-you-uncle)
- [Uncle explain abit](#uncle-explain-abit)

<!-- /TOC -->

## Why leh
Last time Uncle Seng tell ang moh friend that he want go work at the Face Book la. He say no more money liao, every week play 4D but always choose wrong one. He say if he go America there and make money by writing codes, can come back and play more 4D. Huat ah!

But ang moh tell Uncle Seng that his England sibei cui one, sure cannot make it through the "coding interview". Wah, then Uncle Seng super angry. He say then he dunnid the C++ la, Java la, he say if *Singaporean* can make *Singlish*, *limpeh* can make *Singlang*.  

## Simi *Singlang*?

**Singlang:**

```
confirm plus chop x = 5
chope y = 1

x = 5 meh?
    ok den chope y = 6
    alamak den chope y = 7
ok can liao

chope i = 0
wait long long, i = 5 meh?
    chope i = i + 1
ok can liao

simi i

simi "Say something leh: "
chope your_input = makan
simi "ok u say: "
simi your_input

-- Dis one uncle's comment
```

**But last time ang moh say one:**

```
const x = 5;
let y = 1;

if (x == 5) {
    y = 6;
} else {
    y = 7;
}

let i = 0;

while (x != 5) {
    i = i + 1;
}

console.log(i);

console.log("Enter something: ");
let your_input = readLine();
console.log("What you typed: ");
console.log(your_input);

// This is a comment
```

## Uncle i still dun understand

OK la uncle show you.

### The Key Words liddat

| Ang Moh | Singlang |
| ------- | -------- |
| if / boolean test | meh?     |
| then    | ok den   |
| else    | alamak den |
| end block | ok can liao | 
| var     | chope    |
| const   | confirm plus chop |
| while | wait long long |
| print | simi |
| read line | makan |
| -- | Comment out rest of the line |

### Den the Operators liddat

Must use `meh?` hor.

| Operator | Use |
| ------- | -------- |
| `=` | Equality: `x = 5 meh?` |
| `>` | More than: `x > 5 meh?` |
| `<` | Less than: `x < 5 meh?` |
| `>=` | More than or equal to: `x >= 5 meh?` |
| `<=` | Less than or equal to: `x <= 5 meh?` |
| `!=` | Not equal to: `x != 5 meh?` |


## Uncle I want to try!
OK Uncle tell you how.

1. You go install `stack` (https://docs.haskellstack.org/en/stable/README/), den learn how to use the "command line" abit abit .
2. Clone this repository (top right got big green button one).
2. Go the command line den run the `stack build`.
4. You faster test by running `stack exec singlang-exe < test-basic.lah` - liddat the "interpreter" run the codes inside `test-basic.lah`.

## Uncle I want more Singlang!
Uncle release vee-one liao. Uncle release vee-two soon but he cannot pay his StarHub bill. Everyday play 4D then DBS tell him only got $2.27 left. Maybe can take money from CPF...
 *tokens* in the language and what Haskell constructs they map to. 
## How to help you Uncle?
You go the "issues" there and tell Uncle what to put into Singlang. 

## Uncle explain abit
<!--
<details><summary>Click to expand</summary>
<p>
-->
Actually, Uncle get his ang moh friend to explain abit.


**Defining the Language**

The entire language is defined in two files: `res/Lexer.x` and `res/Parser.y`. Note that *Singlang* is a completely defined language on its own, and is not doing string replacement followed by running another language's interpreter. This is to allow for unique syntax and semantics moving forward. 

**Lexer**

`Lexer.x` defines the *tokens* in the language and what Haskell constructs they map to. 

For example, digits in the language are defined as:
```
  $digit+				{ \s -> TInt (read s) }
```

Correspondingly, the `data` definition for the `Token` type has a definition for `TInt Int`. These two constructs define the tokenization for a particular token type.

To **autogenerate the actual Lexer.hs file from Lexer.x**, use the `run_alex.sh` script provided.

**Parser**

`Parser.y` defines the actual syntax of the language (i.e. how the tokens should be combined together). It starts with a `%token` definition which maps the token constructs to a shorter name to be used in the syntax definitions. 

After this, the individual expressions are defined, usually recursively (see the definition for `Exps` and follow the individual sub-definitions). 

To **autogenerate the actual Parser.hs file from Parser.y**, use the `run_happy.sh` script provided.

<!--
</details>
-->