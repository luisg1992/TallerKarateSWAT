function fn() {
  var env = karate.env; // get system property 'karate.env'
  var baseURLReqRes = '';
  var baseURLPetStore = '';

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
    }

  if (env == 'dev') {
    baseURLReqRes = 'https://reqres.in';
    baseURLPetStore = 'https://petstore.swagger.io/v2';
  } else if (env == 'cert') {
    baseURLReqRes = 'https://reqres.cert';
    baseURLPetStore = 'https://petstore.swagger.io/v2';
  }

  var config = {
      env: env,
      baseURLReqRes: baseURLReqRes,
      baseURLPetStore: baseURLPetStore,
      myVarName: 'someValue'
    }


  return config;
}