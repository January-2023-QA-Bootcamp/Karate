Feature: Re-usable features

  @get-player-helper
  Scenario: Title of your scenario
    Given url 'http://localhost:3000'
    And path '/players/21'
    When request {}
    And method GET
    Then status 200

  @get-player-helper-params
  Scenario: Title of your scenario
    Given url url
    And path path
    When request {}
    And method GET
    Then status 200
