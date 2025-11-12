function fn() {

  var config = {
    env: 'dev',
    baseUrl: 'https://demoqa.com',
    loginPassword: 'Test@xx0001',

    loginUsername: 'user_' + Math.floor(Math.random() * 10000),

    // Atau menggunakan UUID Java untuk keunikan yang lebih tinggi:
    // loginUsernameUUID: 'user_' + karate.get('java.util.UUID').randomUUID().toString(),
    // ------------------------------------

    // Variabel data tes lainnya
    isbnValue: '9781449365035',
    title_isbn: 'Speaking JavaScript',
    author: 'Axel Rauschmayer',
    isbnBookAspNet: '9781449337711',

    authToken: null,
    userId: null
  };

  return config;
}