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
  },
}
