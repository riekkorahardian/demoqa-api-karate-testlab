@authorizationComponent @allScenarios
Feature: Component Test - User Authorization

  Background:
    * url baseUrl

  Scenario: As QA, I can check valid authorization
    * def passwordTrue = validPassword
    * def usernameTrue = validUsername

    Given path '/Account/v1/Authorized'
    And request { "userName": "#(usernameTrue)", "password": "#(passwordTrue)" }
    When method post
    Then status 200
    * match response == 'true'

    Scenario: As QA, I can check invalid authorizaiton
    * def passwordFalse = invalidPassword
    * def usernameFalse = invalidUsername 

    Given path '/Account/v1/Authorized'
    And request { "userName": "#(usernameFalse)", "password": "#(passwordFalse)" }
    When method post
    Then status 404
    * match response.code == '1207'
    * match response.message == 'User not found!'