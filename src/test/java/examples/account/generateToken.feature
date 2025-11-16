@generateToken
Feature: A1. Setup Authentication and Token Generation (Reusable)

  Background:
    * url baseUrl
    * def password = validPassword
    * def userData = call read('classpath:examples/account/registerUser.feature')
    * def username = userData.storedUsername
    * def userId = userData.storedUserId
    * print 'Successfully fetch user data from createUser.feature - Username:', username, 'UserID:', userId

  Scenario: Generate Token from Existing User and Verify Authorization Status

    # 1. Generate Token
    Given path '/Account/v1/GenerateToken'
    And request { "userName": "#(username)", "password": "#(password)" }
    When method post
    Then status 200
    * def authToken = response.token
    * print 'Generated Auth Token:', authToken
    * match authToken == '#notnull'
    * match response.status == 'Success'