const uppers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const lowers = "abcdefghijklmnopqrstuvwxyz";
const digits = "0123456789";
const specials = "_-|@.,?/!~#$%^&*(){}[]+=";

type Options = {
  length: number;
  useUppers: boolean;
  useLowers: boolean;
  useDigits: boolean;
  useSpecials: boolean;
};

const defaultOptions: Options = {
  length: 24,
  useUppers: true,
  useLowers: true,
  useDigits: true,
  useSpecials: true,
};

const generatePassword = (inputOptions: Partial<Options> = {}) => {
  const options = { ...defaultOptions, ...inputOptions };
  const { length, useUppers, useLowers, useDigits, useSpecials } = options;
  const charset =
    "" +
    (useUppers ? uppers : "") +
    (useLowers ? lowers : "") +
    (useDigits ? digits : "") +
    (useSpecials ? specials : "");
  return Array.from({ length })
    .map(() => charset.charAt(Math.floor(Math.random() * charset.length)))
    .join("");
};

const logHelps = () => {
  console.log("\nOptions:");
  console.log("--length [int]", "\t", "Password length, default: 24");
  console.log("--no-uppers", "\t", "Exclude uppercase letters from charset");
  console.log("--no-lowers", "\t", "Exclude lowercase letters from charset");
  console.log("--no-digits", "\t", "Exclude digits from charset");
  console.log("--no-specials", "\t", "Exclude special characters from charset");
  console.log(
    "--help",
    "\t\t",
    "Print options. If this flag is present, the script will not run"
  );
  console.log("\n");
};
const run = () => {
  const args = process.argv.slice(2);
  if (args.includes("--help")) {
    logHelps();
    return;
  }
  const lengthIdx = args.indexOf("--length");
  if (!Number.isInteger(+args[lengthIdx + 1])) {
    throw new Error(`${args[lengthIdx + 1]} is not a valid length`);
  }
  const length = parseInt(args[lengthIdx + 1]) || 24;
  const useUppers = !args.includes("--no-uppers");
  const useLowers = !args.includes("--no-lowers");
  const useDigits = !args.includes("--no-digits");
  const useSpecials = !args.includes("--no-specials");
  const pw = generatePassword({
    length,
    useUppers,
    useLowers,
    useDigits,
    useSpecials,
  });
  console.log(pw);
};

run();
