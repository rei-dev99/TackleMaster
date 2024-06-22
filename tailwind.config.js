const { transform } = require("esbuild");

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  theme: {
    colors: {
      'black': '#000080',
      'link': '#1E90FF',
      'orange': '#FF7F50',
      'blue': '#1E90FF',
      'white': '#ffffff',
      'silver': '#C0C0C0',
    },
    borderColor: {
      'black': '#000080',
      'link': '#1E90FF',
      'orange': '#FF7F50',
      'blue': '#1E90FF',
      'white': '#ffffff',
      'silver': '#C0C0C0',
    },
    extend: {
      keyframes: {
        flashFade: {
          "0%": { transform: "translateX(180px)", opacity: 0 },
          "20%": { transform: "translateX(0)", opacity: 1 },
          "80%": { transform: "translateX(0)", opacity: 1 },
          "100%": { transform: "translateX(180px)", opacity: 0 },
        },
      },
      animation: {
        flash: "flashFade 6.0s forwards",
      },
    },
  },
}
