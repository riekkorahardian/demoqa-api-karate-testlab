@createUser
Feature: A1. Setup Authentication and Token Generation (Reusable)

  Background:
    * url baseUrl
    * def password = 'Test@1234'
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

    # 2. GENERATE TOKEN (Sama dengan Scenario 2 Anda)
    Given path '/Account/v1/GenerateToken'
    And request { "userName": "#(storedUsername)", "password": "#(password)" }
    When method post
    Then status 200
    * def authToken = response.token
    * print 'Generated Auth Token:', authToken
    * match authToken == '#notnull'
    * match response.status == 'Success'

    # 3. AUTHORIZED USER CHECK (POST /Authorized)
    # Ini adalah endpoint yang benar untuk status 'true'
    Given path '/Account/v1/Authorized'
    And request { "userName": "#(storedUsername)", "password": "#(password)" }
    When method post
    Then status 200
    * match response == 'true' // Memverifikasi boolean TRUE

    # 4. OUTPUT REUSABLE DATA (Wajib jika feature ini dipanggil)
    * def result = { token: authToken, userId: storedUserId, username: storedUsername }
    * print result