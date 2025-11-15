@getUser
Feature: User Verification - Get User Details by ID

  Background:
    * url baseUrl
    * def password = masterPassword

    * def tokenData = call read('classpath:examples/account/generateToken.feature')
    * def token = tokenData.authToken
    * def storedUsername = tokenData.username
    * def storedUserId = tokenData.userId
    * print 'Successfully fetch auth token from generateToken.feature - Token:', token
    * print 'Successfully fetch user data from generateToken.feature - Username:', storedUsername
    * print 'Successfully fetch user data from generateToken.feature - UserID:', storedUserId

  Scenario: Get user details and verify stored ID
    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + token 
    When method get
    Then status 200
    * match response.userId == storedUserId
    * match response.username == storedUsername