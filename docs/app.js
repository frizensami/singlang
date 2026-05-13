(() => {
const { runProgram } = globalThis.Singlang;

const SOURCE_KEY = "singlang-playground-v2-source";
const STDIN_KEY = "singlang-playground-v2-stdin";
const EXAMPLE_KEY = "singlang-playground-v2-example";

const examples = [
  {
    id: "hello",
    label: "Hello world",
    file: "hello-world.lah",
    code: `ok uncle tell you story ah...

simi "Hello world!"

ok uncle finish liao`,
    input: "",
  },
  {
    id: "variables",
    label: "Variables + maths",
    file: "variables-maths.lah",
    code: `ok uncle tell you story ah...

chope kopi as 2
chope teh as 3
chope total as kopi + teh

simi total

ok uncle finish liao`,
    input: "",
  },
  {
    id: "if-else",
    label: "If / else",
    file: "if-else.lah",
    code: `ok uncle tell you story ah...

chope x as 5

x is 5 meh?
    ok den simi "steady lah"
    alamak den simi "alamak"
ok can liao

ok uncle finish liao`,
    input: "",
  },
  {
    id: "while",
    label: "wait long long loop",
    file: "wait-long-long.lah",
    code: `ok uncle tell you story ah...

chope i as 0

wait long long, i is 4 meh?
    chope i as i + 1
ok can liao

simi i

ok uncle finish liao`,
    input: "",
  },
  {
    id: "interactive",
    label: "makan input",
    file: "makan-input.lah",
    code: `ok uncle tell you story ah...

simi "Say something leh: "
chope input as makan
simi "ok u say: "
simi input

ok uncle finish liao`,
    input: "teh tarik",
  },
  {
    id: "constants",
    label: "Constants",
    file: "constants.lah",
    code: `ok uncle tell you story ah...

confirm plus chop answer is 42
simi answer

ok uncle finish liao`,
    input: "",
  },
  {
    id: "pofma",
    label: "POFMA subtraction",
    file: "pofma.lah",
    code: `ok uncle tell you story ah...

chope y as 1
chope y as POFMA y
simi y

ok uncle finish liao`,
    input: "",
  },
  {
    id: "paiseh",
    label: "paiseh error",
    file: "paiseh-error.lah",
    code: `ok uncle tell you story ah...

simi "Before problem"
paiseh "CMI liao"
simi "After problem"

ok uncle finish liao`,
    input: "",
  },
  {
    id: "readme",
    label: "README full sample",
    file: "readme-sample.lah",
    code: `ok uncle tell you story ah...

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

-- Dis one uncle's comment

ok uncle finish liao`,
    input: "",
  },
];

const sourceCode = document.querySelector("#source-code");
const stdinQueue = document.querySelector("#stdin-queue");
const output = document.querySelector("#program-output");
const status = document.querySelector("#run-status");
const exampleSelect = document.querySelector("#example-select");
const editorFilename = document.querySelector("#editor-filename");
const loadExample = document.querySelector("#load-example");
const runProgramButton = document.querySelector("#run-program");
const clearOutput = document.querySelector("#clear-output");

function setStatus(label, mode = "") {
  status.textContent = label;
  status.className = "status-pill";
  if (mode) {
    status.classList.add(mode);
  }
}

function renderExampleList() {
  for (const example of examples) {
    const option = document.createElement("option");
    option.value = example.id;
    option.textContent = example.label;
    exampleSelect.append(option);
  }
}

function findExample(id) {
  return examples.find((candidate) => candidate.id === id) ?? examples[0];
}

function updateFilename(example) {
  editorFilename.textContent = example?.file ?? "scratch.lah";
}

function loadSelectedExample() {
  const example = findExample(exampleSelect.value);
  sourceCode.value = example.code;
  stdinQueue.value = example.input;
  updateFilename(example);
  localStorage.setItem(SOURCE_KEY, sourceCode.value);
  localStorage.setItem(STDIN_KEY, stdinQueue.value);
  localStorage.setItem(EXAMPLE_KEY, example.id);
  setStatus(`Loaded ${example.label}`);
}

function collectInputLines() {
  if (!stdinQueue.value.trim()) {
    return [];
  }
  return stdinQueue.value.split(/\r?\n/);
}

function renderOutput(lines, metadata = "") {
  const text = lines.length > 0 ? lines.join("\n") : "(no output)";
  output.textContent = metadata ? `${text}\n\n${metadata}` : text;
}

function runCurrentProgram() {
  localStorage.setItem(SOURCE_KEY, sourceCode.value);
  localStorage.setItem(STDIN_KEY, stdinQueue.value);

  try {
    const result = runProgram(sourceCode.value, { inputLines: collectInputLines() });
    const metadata = `Tokens: ${result.tokens.length - 1}
Statements: ${result.ast.length}
Remaining input lines: ${result.remainingInput.length}`;
    renderOutput(result.output, metadata);
    setStatus("Run succeeded", "success");
  } catch (error) {
    renderOutput([], `Error: ${error.message}`);
    setStatus("Run failed", "error");
  }
}

function restoreSession() {
  const savedExample = findExample(localStorage.getItem(EXAMPLE_KEY));
  const savedSource = localStorage.getItem(SOURCE_KEY);
  const savedInput = localStorage.getItem(STDIN_KEY);
  exampleSelect.value = savedExample.id;
  if (savedSource) {
    sourceCode.value = savedSource;
  } else {
    sourceCode.value = savedExample.code;
  }
  stdinQueue.value = savedInput ?? savedExample.input;
  updateFilename(savedSource && savedSource !== savedExample.code ? null : savedExample);
}

renderExampleList();
restoreSession();
renderOutput(
  [
    "Browser playground ready.",
    "Press Run lah when ready.",
  ]
);

exampleSelect.addEventListener("change", loadSelectedExample);
loadExample.addEventListener("click", loadSelectedExample);
runProgramButton.addEventListener("click", runCurrentProgram);
clearOutput.addEventListener("click", () => {
  renderOutput([]);
  setStatus("Idle");
});
})();
