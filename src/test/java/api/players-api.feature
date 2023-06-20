Feature: Validating Players API

  Background: 
    * url baseUrl
    * path apiConstant.playersEndpoint

  @get-players
  Scenario: Get Players Validation
    Given request {}
    When method GET
    Then status 200
    * print 'Test Done'
    * print response
    And retry until response.[3].id > 6
    * match response.[3].id == 4

  @post-players-str-json
  Scenario: Post Player
    Given header Content-Type = 'application/json'
    And request {firstName:'Habibul', lastName:'Bashar', DOB:'07/01/1977', countryCode: 30}
    And method POST
    Then status 201

  @post-players-json-file-accept
  Scenario: Post Player
    Given header Accept = 'application/json'
    * def payload = read('classpath:api/player.json')
    And request payload
    And method POST
    Then status 201

  @post-players-json-file-set
  Scenario Outline: Post Player
    Given header Accept = 'application/json'
    * def payload = read('classpath:api/player.json')
    * set payload.firstName = <firstName>
    * set payload.lastName = <lastName>
    * set payload.DOB = <dob>
    * set payload.countryCode = <countryCode>
    And request payload
    And method POST
    Then status 201
    And match response.firstName == <firstName>
    And match response.lastName == <lastName>
    And match response.DOB == <dob>
    And match response.countryCode == <countryCode>

    Examples: 
      | firstName | lastName     | dob          | countryCode |
      | 'Haris'   | 'Rouf'       | '30/08/1988' |          20 |
      | 'AB'      | 'DeVilliars' | '02/01/1990' |          70 |

  @post-get
  Scenario: Post Player with Get players and validate
    Given header Accept = 'application/json'
    * def payload = read('classpath:api/player.json')
    * set payload.firstName = 'Dale'
    * set payload.lastName = 'Sten'
    * set payload.DOB = '20/05/1996'
    * set payload.countryCode = '70'
    And request payload
    And method POST
    Then status 201
    * def getPlayer = call read('classpath:helper/helper.feature@get-player-helper')
    * match getPlayer.response.id == 21
    * match getPlayer.response.firstName == 'Dale'
    * match getPlayer.response.lastName == 'Sten'
    * match getPlayer.response.DOB == '20/05/1996'
    * match getPlayer.response.countryCode == '70'

  @reusable-helper-param
  Scenario: Reuse helper sceanrio
    #* def endpoint = playersEndpoint + '/21'
    * def getPlayer = call read('classpath:helper/helper.feature@get-player-helper-params'){url:#(baseUrl), path:#(apiConstant.playersEndpoint + '/21')}
    * match getPlayer.response.id == 21
    * match getPlayer.response.firstName == 'Dale'
    * match getPlayer.response.lastName == 'Sten'
    * match getPlayer.response.DOB == '20/05/1996'
    * match getPlayer.response.countryCode == '70'

  @java-custom
  Scenario: Calling Java Method
    * def common = Java.type('helper.Common')
    * def time = common.getTime()
    * print time
    * common.printOSType()

  @inbuilt-js
  Scenario: In-built JS Function
    * def fun =
      """
      function(){
      	print("in-built js");
      }
      """
    * eval fun()
    * def retFun =
    """
    function(){
    	return 3;
    }
    """
		* def result = retFun()
		* print result
		* def x = 10
		* def jsloop =
		"""
		function(){
			var i = x*2;
			print(i)
			return i;
		}
		"""
		* karate.repeat(3,jsloop)