const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    fontFamily: {
      sans: ['Rubik', '"Source Sans 3"', ...defaultTheme.fontFamily.sans],
    },
    extend: {
      colors: {
        'accent': '#ffff02',
        'accent-light': '#ffff80',
      },
      borderWidth: {
        '3': '3px'
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
