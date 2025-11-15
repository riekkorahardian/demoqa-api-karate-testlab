@createUser
Feature: A1. Setup Authentication and Token Generation (Reusable)

  Background:
    * url baseUrl
    * def password = masterPassword
    * def randomUsername = generateRandomUsername() // Dipanggil sekali
    * print 'Generated Username:', randomUsername

  Scenario: Register, Generate Token, and Verify Authorization Status

    # 1. REGISTER NEW USER (Sama dengan Scenario 1 Anda)
    Given path '/Account/v1/User'
    And request { "userName": "#(randomUsername)", "password": "#(password)" }
    When method post
    Then status 201
    * def storedUserId = response.userID
    * def storedUsername = response.username
    * match response.username == randomUsername // Verifikasi Input/Output
    * print 'Registered User ID:', storedUserId
    * print 'Registered Username:', storedUsername
