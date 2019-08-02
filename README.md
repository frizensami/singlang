# Singlang: Now uncle also can code

## Example

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

simi "Enter something: "
chope your_input = makan
simi "What you typed: "
simi your_input

-- This is a comment
```

**But last time ang moh say something like:**

```
const x = 5
var y = 1

if x = 5
    then y = 6
    else y = 7

var i = 0
while x != 5
    i = i + 1

print i

print "Enter something: "
var your_input = readLine()
print "What you typed: "
print your_input

// This is a comment
```

## Syntax

### Keywords

| Ang Moh | Singlang |
| ------- | -------- |
| if / run comparison | meh?     |
| then    | ok den   |
| else    | alamak den |
| end block | ok can liao | 
| var     | chope    |
| const   | confirm plus chop |
| while | wait long long |
| print | simi |
| read line | makan |
| -- | Comment out rest of the line |

### Operators

Must use `meh?` hor.

| Operator | Use |
| ------- | -------- |
| = | Equality test: `x = 5 meh?` |
| > | More than: `x > 5 meh?` |
| < | Less than: `x < 5 meh?` |
| >= | More than or equal to: `x >= 5 meh?` |
| <= | Less than or equal to: `x <= 5 meh?` |
| != | Not equal to: `x != 5 meh?` |


## Running the interpreter
Pre-requisites: Have `stack` installed (https://docs.haskellstack.org/en/stable/README/), have some command-line familiarity.

1. Clone this repository
2. Run `stack build`
3. Run `stack exec singlang-exe < test-basic.lah` to run the interpreter with the file `test-basic.lah` 

## Status
Work-in-progress. More keywords are intended for the core language.  