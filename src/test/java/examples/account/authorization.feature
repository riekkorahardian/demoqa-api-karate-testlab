@generateToken
Feature: A1. Setup Authentication and Token Generation (Reusable)

  Background:
    * url baseUrl
    * def password = masterPassword
    * def userData = call read('classpath:examples/account/registerUser.feature')
    * def username = userData.storedUsername
    * def userId = userData.storedUserId
    * print 'Successfully fetch user data from createUser.feature - Username:', username, 'UserID:', userId

  Scenario: Verify Authorization Status

    Given path '/Account/v1/Authorized'
    And request { "userName": "#(username)", "password": "#(password)" }
    When method post
    Then status 200
    * match response == 'true' // Memverifikasi boolean TRUE