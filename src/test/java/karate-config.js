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
    masterPassword: 'Test@1234',

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