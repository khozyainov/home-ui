module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'gr-purple': "#A43AB2",
        'gr-pink': "#E13680",
      },
      spacing: {
        '68': "17rem"
      }
    },
  },
  variants: {
    extend: {
      backgroundColor: ['active'],
      scale: ['active'],
    }
  },
  plugins: [],
}
