var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var uppers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var lowers = "abcdefghijklmnopqrstuvwxyz";
var digits = "0123456789";
var specials = "_-|@.,?/!~#$%^&*(){}[]+=";
var defaultOptions = {
    length: 24,
    useUppers: true,
    useLowers: true,
    useDigits: true,
    useSpecials: true
};
var generatePassword = function (inputOptions) {
    if (inputOptions === void 0) { inputOptions = {}; }
    var options = __assign(__assign({}, defaultOptions), inputOptions);
    var length = options.length, useUppers = options.useUppers, useLowers = options.useLowers, useDigits = options.useDigits, useSpecials = options.useSpecials;
    var charset = "" +
        (useUppers ? uppers : "") +
        (useLowers ? lowers : "") +
        (useDigits ? digits : "") +
        (useSpecials ? specials : "");
    return Array.from({ length: length })
        .map(function () { return charset.charAt(Math.floor(Math.random() * charset.length)); })
        .join("");
};
var logHelps = function () {
    console.log("\nOptions:");
    console.log("--length [int]", "\t", "Password length, default: 24");
    console.log("--no-uppers", "\t", "Exclude uppercase letters from charset");
    console.log("--no-lowers", "\t", "Exclude lowercase letters from charset");
    console.log("--no-digits", "\t", "Exclude digits from charset");
    console.log("--no-specials", "\t", "Exclude special characters from charset");
    console.log("--help", "\t\t", "Print options. If this flag is present, the script will not run");
    console.log("\n");
};
var run = function () {
    var args = process.argv.slice(2);
    if (args.includes("--help")) {
        logHelps();
        return;
    }
    var lengthIdx = args.indexOf("--length");
    if (!Number.isInteger(+args[lengthIdx + 1])) {
        throw new Error(args[lengthIdx + 1] + " is not a valid length");
    }
    var length = parseInt(args[lengthIdx + 1]) || 24;
    var useUppers = !args.includes("--no-uppers");
    var useLowers = !args.includes("--no-lowers");
    var useDigits = !args.includes("--no-digits");
    var useSpecials = !args.includes("--no-specials");
    var pw = generatePassword({
        length: length,
        useUppers: useUppers,
        useLowers: useLowers,
        useDigits: useDigits,
        useSpecials: useSpecials
    });
    console.log(pw);
};
run();
