@registerUser
Feature: A1. Setup Authentication and Token Generation (Reusable)

  Background:
    * url baseUrl
    * def password = validPassword
    * def randomUsername = generateRandomUsername() 
    * print 'Generated Username:', randomUsername

  Scenario: Register, Generate Token, and Verify Authorization Status

    Given path '/Account/v1/User'
    And request { "userName": "#(randomUsername)", "password": "#(password)" }
    When method post
    Then status 201
    * def storedUserId = response.userID
    * def storedUsername = response.username
    * match response.username == randomUsername
    * print 'Registered User ID:', storedUserId
    * print 'Registered Username:', storedUsername
