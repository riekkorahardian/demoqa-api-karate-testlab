@authorizationComponent @allScenarios
Feature: A1. Setup Authentication and Token Generation (Reusable)

  Background:
    * url baseUrl

  Scenario: Verify Authorization Status with valid user credentials
    * def passwordTrue = validPassword
    * def usernameTrue = validUsername

    Given path '/Account/v1/Authorized'
    And request { "userName": "#(usernameTrue)", "password": "#(passwordTrue)" }
    When method post
    Then status 200
    * match response == 'true'

    Scenario: Verify Authorization Status with invalid user credentials
    * def passwordFalse = invalidPassword
    * def usernameFalse = invalidUsername 

    Given path '/Account/v1/Authorized'
    And request { "userName": "#(usernameFalse)", "password": "#(passwordFalse)" }
    When method post
    Then status 404
    * match response.code == '1207'
    * match response.message == 'User not found!'