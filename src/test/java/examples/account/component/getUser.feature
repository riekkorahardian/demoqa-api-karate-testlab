@getUserComponent @allScenarios
Feature:Component Test - Get User
  Background:
    * url baseUrl
    * def tokenFalse = invalidToken
    * def userIdFalse = invalidUserId

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

  Scenario: As QA, I can check user profile with invalid userid
    Given path '/Account/v1/User/' + userIdFalse
    And header Authorization = 'Bearer ' + tokenFalse 
    When method get
    Then status 401
    * match response.code == "1207"
    * match response.message == "User not found!"

  Scenario:  As QA, I can check user profile with invalid authorization
    * def tokenData = call read('classpath:examples/account/generateToken.feature')
    * def token = tokenData.authToken
    * def storedUsername = tokenData.username
    * def storedUserId = tokenData.userId
    * print 'Successfully fetch auth token from generateToken.feature - Token:', token
    * print 'Successfully fetch user data from generateToken.feature - Username:', storedUsername
    * print 'Successfully fetch user data from generateToken.feature - UserID:', storedUserId


    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + tokenFalse 
    When method get
    Then status 401
    * match response.code == "1200"
    * match response.message == "User not authorized!"
