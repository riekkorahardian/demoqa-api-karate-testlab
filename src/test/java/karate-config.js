function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://demoqa.com',
    validPassword: 'Test@1234',
    validUsername: 'User_45985',
    invalidPassword: 'WrongPassword',
    integerPassword: 12345678,
    invalidUsername: 'invalid-user',
    invalidToken: 'InvalidToken12345',
    validUserId: 'f1a5e2d3-4b6c-7d8e-9f0a-67b5ad6a-ef3e-48c4-9156-758a9d684084',
    invalidUserId: '00000000-0000-0000-0000-000000000000',
    isbnJavascriptDesignPatterns: '9781449331818',
    updateBooksIsbn: '9781593277574',
    updateBooksTitle: 'Understanding ECMAScript 6',


    generateRandomUsername: function() {
      return 'User_' + Math.floor(Math.random() * 100000)
    }
  }

  karate.configure ('connectTimeout', 5000);
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}