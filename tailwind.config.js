const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    screens: {
      xs: "440px",
      ...defaultTheme.screens,
    },
    extend: {
      colors: {
        primary: {
          100: "#D3EAF5",
          200: "#66B4DB",
          300: "#2983B1", //基本主色
          400: "#237096",
          500: "#1D5B7A",
          600: "#16465E",
        },
        secondary: {
          100: "#FEF9EE",
          200: "#FEF1D7",
          300: "#FBD588", //基本副色
          400: "#F9C04B", //logo副色
          500: "#8B5E04",
        },
        warning: {
          100: "#F192AA",
          200: "#D883A3",
        },
        safe: "#98C37C",
        draft: "#CAC7AE",
        rice: "#F0EDCE",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
