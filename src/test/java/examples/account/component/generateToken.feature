@generateTokenComponent @allScenarios
Feature: Component Test - Generate Auth Token

  Background:
    * url baseUrl

  Scenario: As QA, I can check token generation for valid credential
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

  Scenario: As QA, I can check token generation for invalid credential
    * def passwordFalse = invalidPassword
    * def usernameFalse = invalidUsername

    Given path '/Account/v1/GenerateToken'
    And request { "userName": "#(usernameFalse)", "password": "#(passwordFalse)" }
    When method post
    Then status 400
    * match authToken == null
    * match response.result == 'User authorization failed.'