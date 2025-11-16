@getUserComponent @allScenarios
Feature: Get User Details by ID

  Background:
    * url baseUrl

  Scenario: As QA, I can check user profile with book collections
    * def tokenData = call read('classpath:examples/account/generateToken.feature')
    * def token = tokenData.authToken
    * def storedUsername = tokenData.username
    * def storedUserId = tokenData.userId
    * print 'Successfully fetch auth token from generateToken.feature - Token:', token
    * print 'Successfully fetch user data from generateToken.feature - Username:', storedUsername
    * print 'Successfully fetch user data from generateToken.feature - UserID:', storedUserId

    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + token 
    When method get
    Then status 200
    * match response.userId == storedUserId
    * match response.username == storedUsername
    * match response.books == []

  Scenario: As QA, I can check user profile with invalid authorization
    * def tokenFalse = invalidToken
    * def userIdFalse = invalidUserId
    Given path '/Account/v1/User/' + invalidUserId
    And header Authorization = 'Bearer ' + invalidToken 
    When method get
    Then status 401
