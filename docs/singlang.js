(() => {
const KEYWORDS = [
  ["PROG_START", "ok uncle tell you story ah..."],
  ["PROG_END", "ok uncle finish liao"],
  ["CONST", "confirm plus chop"],
  ["WHILE", "wait long long,"],
  ["THEN", "ok den"],
  ["ELSE", "alamak den"],
  ["END", "ok can liao"],
  ["IFMARK", "meh?"],
  ["THROW", "paiseh"],
  ["PRINT", "simi"],
  ["READ", "makan"],
  ["LET", "chope"],
  ["EQCMP", "is"],
  ["EQ", "as"],
  ["NEQ", "not"],
  ["MINUS", "POFMA"],
];

const IDENTIFIER_CHAR = /[A-Za-z0-9_']/;

function syntaxError(message, token) {
  const where = token ? ` at line ${token.line}, column ${token.column}` : "";
  return new Error(`${message}${where}`);
}

function runtimeError(message) {
  return new Error(message);
}

function advancePosition(text, position) {
  for (const char of text) {
    if (char === "\n") {
      position.line += 1;
      position.column = 1;
    } else {
      position.column += 1;
    }
  }
}

function boundarySatisfied(source, endIndex) {
  const nextChar = source[endIndex];
  return nextChar == null || !IDENTIFIER_CHAR.test(nextChar);
}

function keywordMatches(source, index, keyword) {
  return source.startsWith(keyword, index) && boundarySatisfied(source, index + keyword.length);
}

function tokenize(source) {
  const tokens = [];
  const position = { index: 0, line: 1, column: 1 };

  while (position.index < source.length) {
    const char = source[position.index];

    if (/\s/.test(char)) {
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (source.startsWith("--", position.index)) {
      const lineEnd = source.indexOf("\n", position.index);
      const endIndex = lineEnd === -1 ? source.length : lineEnd;
      const skipped = source.slice(position.index, endIndex);
      advancePosition(skipped, position);
      position.index = endIndex;
      continue;
    }

    let matchedKeyword = false;
    for (const [type, keyword] of KEYWORDS) {
      if (keywordMatches(source, position.index, keyword)) {
        tokens.push({
          type,
          value: keyword,
          line: position.line,
          column: position.column,
        });
        advancePosition(keyword, position);
        position.index += keyword.length;
        matchedKeyword = true;
        break;
      }
    }

    if (matchedKeyword) {
      continue;
    }

    if (source.startsWith("<=", position.index)) {
      tokens.push({ type: "LTE", value: "<=", line: position.line, column: position.column });
      advancePosition("<=", position);
      position.index += 2;
      continue;
    }

    if (source.startsWith(">=", position.index)) {
      tokens.push({ type: "GTE", value: ">=", line: position.line, column: position.column });
      advancePosition(">=", position);
      position.index += 2;
      continue;
    }

    if (char === "+") {
      tokens.push({ type: "PLUS", value: "+", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === "-") {
      tokens.push({ type: "MINUS", value: "-", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === "*") {
      tokens.push({ type: "TIMES", value: "*", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === "/") {
      tokens.push({ type: "DIV", value: "/", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === "(") {
      tokens.push({ type: "LPAREN", value: "(", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === ")") {
      tokens.push({ type: "RPAREN", value: ")", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === "<") {
      tokens.push({ type: "LT", value: "<", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === ">") {
      tokens.push({ type: "GT", value: ">", line: position.line, column: position.column });
      advancePosition(char, position);
      position.index += 1;
      continue;
    }

    if (char === '"') {
      let endIndex = position.index + 1;
      while (endIndex < source.length && source[endIndex] !== '"') {
        endIndex += 1;
      }
      if (endIndex >= source.length) {
        throw syntaxError("Unterminated string literal", {
          line: position.line,
          column: position.column,
        });
      }
      const literal = source.slice(position.index, endIndex + 1);
      tokens.push({
        type: "STRING",
        value: literal,
        line: position.line,
        column: position.column,
      });
      advancePosition(literal, position);
      position.index = endIndex + 1;
      continue;
    }

    if (/[0-9]/.test(char)) {
      let endIndex = position.index + 1;
      while (endIndex < source.length && /[0-9]/.test(source[endIndex])) {
        endIndex += 1;
      }
      const literal = source.slice(position.index, endIndex);
      tokens.push({
        type: "INT",
        value: Number.parseInt(literal, 10),
        line: position.line,
        column: position.column,
      });
      advancePosition(literal, position);
      position.index = endIndex;
      continue;
    }

    if (/[A-Za-z]/.test(char)) {
      let endIndex = position.index + 1;
      while (endIndex < source.length && IDENTIFIER_CHAR.test(source[endIndex])) {
        endIndex += 1;
      }
      const identifier = source.slice(position.index, endIndex);
      tokens.push({
        type: "VAR",
        value: identifier,
        line: position.line,
        column: position.column,
      });
      advancePosition(identifier, position);
      position.index = endIndex;
      continue;
    }

    throw syntaxError(`Unexpected character ${char}`, {
      line: position.line,
      column: position.column,
    });
  }

  tokens.push({ type: "EOF", value: "", line: position.line, column: position.column });
  return tokens;
}

class Parser {
  constructor(tokens) {
    this.tokens = tokens;
    this.index = 0;
  }

  current() {
    return this.tokens[this.index];
  }

  consume(type, message) {
    const token = this.current();
    if (token.type !== type) {
      throw syntaxError(message ?? `Expected ${type} but found ${token.type}`, token);
    }
    this.index += 1;
    return token;
  }

  match(type) {
    if (this.current().type === type) {
      this.index += 1;
      return true;
    }
    return false;
  }

  parseProgram() {
    this.consume("PROG_START", "Program must start with ok uncle tell you story ah...");
    const body = [];
    while (this.current().type !== "PROG_END" && this.current().type !== "EOF") {
      body.push(this.parseStatement());
    }
    this.consume("PROG_END", "Program must end with ok uncle finish liao");
    this.consume("EOF", "Unexpected tokens after program end");
    return body;
  }

  parseBlock(stoppers) {
    const body = [];
    while (!stoppers.includes(this.current().type)) {
      if (this.current().type === "EOF") {
        throw syntaxError("Unexpected end of block", this.current());
      }
      body.push(this.parseStatement());
    }
    return body;
  }

  parseStatement() {
    const token = this.current();
    switch (token.type) {
      case "LET": {
        this.consume("LET");
        const name = this.consume("VAR", "Expected variable name after chope").value;
        this.consume("EQ", "Expected as in chope assignment");
        return { kind: "Let", name, value: this.parseExpression() };
      }
      case "CONST": {
        this.consume("CONST");
        const name = this.consume("VAR", "Expected variable name after confirm plus chop").value;
        this.consume("EQCMP", "Expected is in constant declaration");
        return { kind: "Const", name, value: this.parseExpression() };
      }
      case "WHILE": {
        this.consume("WHILE");
        const comparison = this.parseComparison();
        this.consume("IFMARK", "Expected meh? after while comparison");
        const body = this.parseBlock(["END"]);
        this.consume("END", "Expected ok can liao to end while block");
        return { kind: "While", comparison, body };
      }
      case "THROW": {
        this.consume("THROW");
        const message = this.consume("STRING", "paiseh expects a string literal").value;
        return { kind: "Throw", message };
      }
      case "PRINT":
        this.consume("PRINT");
        return { kind: "Print", value: this.parseExpression() };
      default:
        return this.parseConditionalOrExpression();
    }
  }

  parseConditionalOrExpression() {
    const left = this.parseArithmetic();
    if (!this.isComparisonOperator(this.current().type)) {
      return left;
    }
    const comparison = this.finishComparison(left);
    this.consume("IFMARK", "Expected meh? after comparison");
    this.consume("THEN", "Expected ok den to start if branch");
    const truthy = this.parseBlock(["ELSE"]);
    this.consume("ELSE", "Expected alamak den to start else branch");
    const falsy = this.parseBlock(["END"]);
    this.consume("END", "Expected ok can liao to end if block");
    return { kind: "IfThenElse", comparison, truthy, falsy };
  }

  parseComparison() {
    const left = this.parseArithmetic();
    if (!this.isComparisonOperator(this.current().type)) {
      throw syntaxError("Expected a comparison operator", this.current());
    }
    return this.finishComparison(left);
  }

  finishComparison(left) {
    const operator = this.current().type;
    this.index += 1;
    const right = this.parseArithmetic();
    return { kind: "Cmp", operator, left, right };
  }

  isComparisonOperator(type) {
    return ["EQCMP", "GT", "LT", "GTE", "LTE", "NEQ"].includes(type);
  }

  parseExpression() {
    if (this.current().type === "READ") {
      this.consume("READ");
      return { kind: "Read" };
    }
    return this.parseArithmetic();
  }

  parseArithmetic() {
    let expression = this.parseTerm();
    while (this.current().type === "PLUS" || this.current().type === "MINUS") {
      const operator = this.current().type;
      this.index += 1;
      const right = this.parseTerm();
      expression = {
        kind: operator === "PLUS" ? "Plus" : "Minus",
        left: expression,
        right,
      };
    }
    return expression;
  }

  parseTerm() {
    let expression = this.parseFactor();
    while (this.current().type === "TIMES" || this.current().type === "DIV") {
      const operator = this.current().type;
      this.index += 1;
      const right = this.parseFactor();
      expression = {
        kind: operator === "TIMES" ? "Times" : "Div",
        left: expression,
        right,
      };
    }
    return expression;
  }

  parseFactor() {
    const token = this.current();
    switch (token.type) {
      case "MINUS":
        this.consume("MINUS");
        return { kind: "Negate", value: this.parseFactor() };
      case "INT":
        this.consume("INT");
        return { kind: "Int", value: token.value };
      case "STRING":
        this.consume("STRING");
        return { kind: "Str", value: token.value };
      case "VAR":
        this.consume("VAR");
        return { kind: "Var", name: token.value };
      case "READ":
        this.consume("READ");
        return { kind: "Read" };
      case "LPAREN": {
        this.consume("LPAREN");
        const expression = this.parseArithmetic();
        this.consume("RPAREN", "Expected )");
        return expression;
      }
      default:
        throw syntaxError(`Unexpected token ${token.type}`, token);
    }
  }
}

function parse(source) {
  const tokens = Array.isArray(source) ? source : tokenize(source);
  const parser = new Parser(tokens);
  return parser.parseProgram();
}

function intValue(value) {
  return { type: "int", value };
}

function stringValue(value) {
  return { type: "string", value };
}

function showValue(programValue) {
  return String(programValue.value);
}

function expectInt(programValue) {
  if (programValue.type !== "int") {
    throw runtimeError(`Expected integer but got ${showValue(programValue)}`);
  }
  return programValue.value;
}

function compareProgramValues(left, right) {
  if (left.type !== right.type) {
    throw runtimeError(`Cannot compare values ${showValue(left)} and ${showValue(right)}`);
  }
  if (left.value === right.value) {
    return 0;
  }
  return left.value < right.value ? -1 : 1;
}

function cloneState(state) {
  return {
    variables: Object.fromEntries(state.variables),
    constants: Object.fromEntries(state.constants),
  };
}

function evaluateComparison(node, state, context) {
  const left = evaluateExpression(node.left, state, context);
  const right = evaluateExpression(node.right, state, context);
  const ordering = compareProgramValues(left, right);
  switch (node.operator) {
    case "EQCMP":
      return ordering === 0;
    case "GT":
      return ordering > 0;
    case "LT":
      return ordering < 0;
    case "GTE":
      return ordering >= 0;
    case "LTE":
      return ordering <= 0;
    case "NEQ":
      return ordering !== 0;
    default:
      throw runtimeError(`Unknown comparison operator ${node.operator}`);
  }
}

function evaluateExpression(node, state, context) {
  switch (node.kind) {
    case "Int":
      return intValue(node.value);
    case "Str":
      return stringValue(node.value);
    case "Var":
      if (state.variables.has(node.name)) {
        return state.variables.get(node.name);
      }
      if (state.constants.has(node.name)) {
        return state.constants.get(node.name);
      }
      throw runtimeError(`var/const ${node.name} not defined!`);
    case "Read":
      if (context.inputIndex >= context.inputLines.length) {
        throw runtimeError("Input exhausted for makan");
      }
      return stringValue(context.inputLines[context.inputIndex++]);
    case "Plus": {
      const left = evaluateExpression(node.left, state, context);
      const right = evaluateExpression(node.right, state, context);
      return intValue(expectInt(left) + expectInt(right));
    }
    case "Minus": {
      const left = evaluateExpression(node.left, state, context);
      const right = evaluateExpression(node.right, state, context);
      return intValue(expectInt(left) - expectInt(right));
    }
    case "Times": {
      const left = evaluateExpression(node.left, state, context);
      const right = evaluateExpression(node.right, state, context);
      return intValue(expectInt(left) * expectInt(right));
    }
    case "Div": {
      const left = evaluateExpression(node.left, state, context);
      const right = evaluateExpression(node.right, state, context);
      const divisor = expectInt(right);
      if (divisor === 0) {
        throw runtimeError("divide by zero");
      }
      return intValue(Math.trunc(expectInt(left) / divisor));
    }
    case "Negate": {
      const value = evaluateExpression(node.value, state, context);
      return intValue(-expectInt(value));
    }
    default:
      throw runtimeError(`Cannot evaluate expression kind ${node.kind}`);
  }
}

function evaluateBlock(statements, state, context) {
  let value = stringValue("");
  for (const statement of statements) {
    value = evaluateStatement(statement, state, context);
  }
  return value;
}

function evaluateStatement(node, state, context) {
  switch (node.kind) {
    case "Let": {
      if (state.constants.has(node.name)) {
        throw runtimeError(`ERROR: Redefinition of constant ${node.name}`);
      }
      const value = evaluateExpression(node.value, state, context);
      state.variables.set(node.name, value);
      return value;
    }
    case "Const": {
      const value = evaluateExpression(node.value, state, context);
      if (state.variables.has(node.name)) {
        state.variables.delete(node.name);
      }
      state.constants.set(node.name, value);
      return value;
    }
    case "Print": {
      const value = evaluateExpression(node.value, state, context);
      const rendered = showValue(value);
      context.output.push(rendered);
      return stringValue(rendered);
    }
    case "Throw":
      context.output.push(`SIAO LIAO: Exception thrown - ${node.message}`);
      throw runtimeError("User exception triggered.");
    case "IfThenElse":
      if (evaluateComparison(node.comparison, state, context)) {
        return evaluateBlock(node.truthy, state, context);
      }
      return evaluateBlock(node.falsy, state, context);
    case "While":
      if (evaluateComparison(node.comparison, state, context)) {
        return stringValue("");
      }
      evaluateBlock(node.body, state, context);
      return evaluateStatement(node, state, context);
    default:
      return evaluateExpression(node, state, context);
  }
}

function execute(ast, inputLines = []) {
  const state = {
    variables: new Map(),
    constants: new Map(),
  };
  const context = {
    inputLines,
    inputIndex: 0,
    output: [],
  };
  evaluateBlock(ast, state, context);
  return {
    output: context.output,
    state: cloneState(state),
    remainingInput: inputLines.slice(context.inputIndex),
  };
}

function runProgram(source, options = {}) {
  const tokens = tokenize(source);
  const ast = parse(tokens);
  const inputLines = options.inputLines ?? [];
  const result = execute(ast, inputLines);
  return { tokens, ast, ...result };
}

globalThis.Singlang = Object.freeze({
  execute,
  parse,
  runProgram,
  tokenize,
});
})();
