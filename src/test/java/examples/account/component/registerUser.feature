@registerUserComponent @allScenarios
Feature: Register User

  Background:
    * url baseUrl

  Scenario: As QA, I can check register user with valid username and password
    * def passwordTrue = validPassword
    * def randomUsername = generateRandomUsername() 
    * print 'Generated Username:', randomUsername

    Given path '/Account/v1/User'
    And request { "userName": "#(randomUsername)", "password": "#(passwordTrue)" }
    When method post
    Then status 201
    * match response.username == randomUsername


  Scenario: As QA, I can check register user with invalid data type username and password
    * def passwordFalse = invalidPassword
    * def usernameFalse = invalidUsername

    Given path '/Account/v1/User'
    And request { "userName": "#(usernameFalse)", "password": "#(passwordFalse)" }
    When method post
    Then status 400
    * match response.message == "Passwords must have at least one non alphanumeric character, one digit ('0'-'9'), one uppercase ('A'-'Z'), one lowercase ('a'-'z'), one special character and Password must be eight characters or longer."
