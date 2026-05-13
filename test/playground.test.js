import test from "node:test";
import assert from "node:assert/strict";

import "../docs/singlang.js";

const { execute, parse, runProgram, tokenize } = globalThis.Singlang;

test("tokenize handles basic assignments", () => {
  const tokens = tokenize("chope x as 5");
  assert.deepEqual(
    tokens.slice(0, 4).map((token) => token.type),
    ["LET", "VAR", "EQ", "INT"]
  );
});

test("tokenize maps POFMA to subtraction", () => {
  const tokens = tokenize("chope y as POFMA y");
  assert.deepEqual(
    tokens.slice(0, 5).map((token) => token.type),
    ["LET", "VAR", "EQ", "MINUS", "VAR"]
  );
});

test("parse builds a simple let program", () => {
  const ast = parse(`ok uncle tell you story ah...

chope x as 5

ok uncle finish liao`);
  assert.equal(ast[0].kind, "Let");
  assert.equal(ast[0].name, "x");
  assert.equal(ast[0].value.kind, "Int");
});

test("runProgram matches readme output", () => {
  const result = runProgram(`ok uncle tell you story ah...

confirm plus chop x is 5
chope y as 1

x is 5 meh?
    ok den chope y as 6
    alamak den chope y as 7
ok can liao

chope i as 0
wait long long, i is 5 meh?
    chope i as i + 1
ok can liao

simi i

simi "Say something leh: "
chope u_say as "Simulated user input"
simi "ok u say: "
simi u_say

ok uncle finish liao`);

  assert.deepEqual(result.output, [
    "5",
    '"Say something leh: "',
    '"ok u say: "',
    '"Simulated user input"',
  ]);
});

test("execute consumes makan input lines", () => {
  const ast = parse(`ok uncle tell you story ah...

chope input as makan
simi input

ok uncle finish liao`);
  const result = execute(ast, ["kopi o"]);
  assert.deepEqual(result.output, ["kopi o"]);
  assert.deepEqual(result.remainingInput, []);
});

test("runProgram preserves current while semantics", () => {
  const result = runProgram(`ok uncle tell you story ah...

chope i as 0
wait long long, i is 3 meh?
    chope i as i + 1
ok can liao
simi i

ok uncle finish liao`);
  assert.deepEqual(result.output, ["3"]);
});

test("redefining a constant through chope throws", () => {
  assert.throws(
    () =>
      runProgram(`ok uncle tell you story ah...

confirm plus chop x is 5
chope x as 7

ok uncle finish liao`),
    /ERROR: Redefinition of constant x/
  );
});

test("makan without enough input fails clearly", () => {
  assert.throws(
    () =>
      runProgram(`ok uncle tell you story ah...

chope input as makan
simi input

ok uncle finish liao`),
    /Input exhausted for makan/
  );
});
