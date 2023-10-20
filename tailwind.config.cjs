/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './public/**/*.html', './src/**/*.{vue,jsx,ts,js}'],
  theme: {
    extend: {
      colors: {
        primaryColor: 'var(--primary-color)',
        secondColor: 'var(--second-color)',
        thirdColor: 'var(--third-color)',
        fourthColor: 'var(--fourth-color)',
        fifthColor: 'var(--fifth-color)',

        bodyColor: 'var(--body-color)',
        bannerColor: 'var(--banner-color)',
        containerColor: 'var(--container-color)',
        firstColor: 'var(--first-color)',
        titleColor: 'var(--title-color)',
        txtColor: 'var(--txt-color)'
      },
      screens: {
        xs: '500px',
        '2xs': '300px'
      }
    }
  },
  plugins: []
}
