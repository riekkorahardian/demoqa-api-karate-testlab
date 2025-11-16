@generateTokenComponent @allScenarios
Feature: Component Test - Generate Auth Token

  Background:
    * url baseUrl

  Scenario: 1. Generate Token with valid user credentials
    * def passwordTrue = validPassword
    * def usernameTrue = validUsername

    Given path '/Account/v1/GenerateToken'
    And request { "userName": "#(usernameTrue)", "password": "#(passwordTrue)" }
    When method post
    Then status 200
    * def authToken = response.token
    * print 'Generated Auth Token:', authToken
    * match authToken == '#notnull'
    * match response.status == 'Success'

  Scenario: 2. Generate Token with invalid user credentials
    * def passwordFalse = invalidPassword
    * def usernameFalse = invalidUsername

    Given path '/Account/v1/GenerateToken'
    And request { "userName": "#(usernameFalse)", "password": "#(passwordFalse)" }
    When method post
    Then status 400
    * match authToken == null
    * match response.result == 'User authorization failed.'