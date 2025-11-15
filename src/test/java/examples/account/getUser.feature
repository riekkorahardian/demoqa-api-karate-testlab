@getUser
Feature: User Verification - Get User Details by ID

  Background:
    * url baseUrl
    # Logika kondisional: Hanya panggil setup jika userId dan authToken TIDAK ada
    * def authData = call read('classpath:examples/account/createUser.feature')
    * def storedUserId = authData.userId
    * def authToken = authData.token
    * def storedUsername = authData.username
    * print 'Retrieving details for User ID: ' + storedUserId
    * print 'Using Auth Token: ' + authToken
    * print 'Stored Username: ' + storedUsername

  Scenario: Get user details and verify stored ID
    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + authToken 
    When method get
    Then status 200
    * match response.userId == storedUserId
    * match response.username == storedUsername
    * return response