module.exports = {
  darkMode: ["class", '[data-theme="dark"]'], // ini buat support dua mode
    content: [
      './resources/js/**/*.jsx',  // Add paths to React components
      './resources/views/**/*.blade.php',  // Add paths to Blade views
    ],
    theme: {
      extend: {
          colors: {
            primary: '#ff7f50', // Warna utama (contoh: coral)
          }
      },
      
    },
    plugins: [],
  };
  