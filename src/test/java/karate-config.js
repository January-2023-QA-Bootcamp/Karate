function fn() {   

	var env = karate.env; // get java system property 'karate.env'
  		karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  
    var config = {
  	baseUrl : 'http://localhost:3000',
  	uiUrl : 'https://www.amazon.com/'
  };
  
  if(env == 'stg'){
  	config.baseUrl = 'http://stg-localhost:3000'
  }else if(env == 'prod'){
  	config.baseUrl = 'http://prod-localhost:3000'
  }
  
  config.apiConstant = karate.callSingle('classpath:helper/constant.js');
  
  karate.configure('retry', { count: 3, interval: 5000 });
  
  return config;
}