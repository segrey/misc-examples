module.exports = {
  env: {
    node: true
  },
  extends: ["eslint:recommended"],
  rules: {
    "no-unused-vars": "off",
    quotes: ["error", "double"],
    semi: ["error", "always"],
    "sort-keys": "error"
  }
};
