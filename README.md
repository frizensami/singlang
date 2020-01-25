# Singlang v2: Now Uncle also can code

<!-- TOC depthFrom:2 -->

- [Why leh](#why-leh)
- [Simi *Singlang*?](#simi-singlang)
- [Uncle i still dun understand](#uncle-i-still-dun-understand)
    - [The Key Words hor](#the-key-words-hor)
    - [Den the Operators hor](#den-the-operators-hor)
- [Uncle I want to try!](#uncle-i-want-to-try)
- [Status](#status)

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

### The Key Words hor

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

### Den the Operators hor

Must use `meh?` hor otherwise cmi.

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

## Status
Uncle release vee-one liao. Uncle release vee-two soon but he dowan pay his StarHub bill. Everyday play 4D then DBS tell him only got $2.27 left. Maybe can take money from CPF...