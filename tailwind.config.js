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
      maxWidth: {
        '1200': '1200px',
        '700': '700px',
      },
      fontFamily: {
        sans: ['Roboto', 'Helvetica', 'Arial', 'Noto Sans JP', 'sans-serif'], // グローバルなテキスト(全体適用)、ユーザー入力
        heading: ['Montserrat', 'Georgia', 'Noto Serif JP', 'serif'], // 見出しで使用、必要に応じて使用
      },
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
