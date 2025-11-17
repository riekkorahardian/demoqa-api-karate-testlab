@saveBooksComponent
Feature: Component Test - Save Books

  Background:
    * url baseUrl
    * def password = validPassword
    * def dummyToken = invalidToken
    * def invalidIsbn = dummyIsbn

    * def tokenData = call read('classpath:examples/account/generateToken.feature')
    * def token = tokenData.authToken
    * def storedUsername = tokenData.username
    * def storedUserId = tokenData.userId
    * print 'Successfully fetch auth token from generateToken.feature - Token:', token
    * print 'Successfully fetch user data from generateToken.feature - Username:', storedUsername
    * print 'Successfully fetch user data from generateToken.feature - UserID:', storedUserId

    * def booksData = call read('classpath:examples/bookStore/getBooks.feature')
    * def books1 = booksData.isbn0
    * def books2 = booksData.isbn1
    * print 'Successfully fetch first book ISBN from getBooks.feature - ISBN:', books1
    * print 'Successfully fetch second book ISBN from getBooks.feature - ISBN:', books2

  Scenario: As QA, I can save book into user’s collections
    Given path 'BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token 
    And request { "userId": "#(storedUserId)", "collectionOfIsbns": [{ "isbn": "#(books1)" }, { "isbn": "#(books2)" }] }
    When method post
    Then status 201
    * match response.books[0].isbn == books1
    * match response.books[1].isbn == books2

  Scenario: As QA, I can check save book with invalid token

    Given path 'BookStore/v1/Books'
    And header Authorization = 'Bearer ' + dummyToken 
    And request { "userId": "#(storedUserId)", "collectionOfIsbns": [{ "isbn": "#(books1)" }, { "isbn": "#(books2)" }] }
    When method post
    Then status 401
    * match response.code == "1200"
    * match response.message == "User not authorized!"

@tc01
  Scenario: empty param and verify response status 400

    Given path 'BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token 
    And request { "isbn": "#(books1)"  }
    When method post
    Then status 502