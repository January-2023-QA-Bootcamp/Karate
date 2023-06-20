Feature: Title of your feature

  Background: 
    * def locators = read('classpath:ui/locator.json')

  @chrome
  Scenario: Chrome
    Given driver uiUrl
    When input(locators.searchBox, ['portable charger', Key.ENTER])
    And delay(2000)
    Then print driver.title
    * match driver.title == 'Amazon.com : portable charger'
    * def countTitle = text(locators.countTitle)
    # "//span[contains(.,'portable charger')]/parent::div/parent::div[@class='sg-col-inner']/parent::div/parent::div/parent::h1"
    * print countTitle

  @firefox
  Scenario: Mozilla Firefox
    #* configure driver = { type: 'geckodriver', executable: 'geckodriver', target: '/Applications/Firefox.app'}
    * def driver = com.intuit.karate.driver.firefox.GeckoWebDriver
    * driver.activate()
    Given driver uiUrl
    When input(locators.searchBox, ['portable charger', Key.ENTER])
    And delay(2000)
    Then print driver.title
    * match driver.title == 'Amazon.com : portable charger'
    * def countTitle = text(locators.countTitle)
    * print countTitle

  @msedge
  Scenario: Mozilla Firefox
    * configure driver = { type: 'msedge', addOptions: ["--remote-allow-origins=*"] }
    Given driver uiUrl
    * driver.maximize()
    When input(locators.searchBox, ['portable charger', Key.ENTER])
    And delay(2000)
    Then print driver.title
    * match driver.title == 'Amazon.com : portable charger'
    * def countTitle = text(locators.countTitle)
    * print countTitle
