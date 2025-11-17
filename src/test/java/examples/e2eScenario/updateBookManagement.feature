@e2eUpdateBookManagement @e2eScenario
Feature: E2E Scenario for Update Book Management

  Background:
    * url baseUrl
    * def password = validPassword
    * def books3 = updateBooksIsbn
    * def books3Title = updateBooksTitle

    * def tokenData = call read('classpath:examples/account/generateToken.feature')
    * def token = tokenData.authToken
    * def storedUsername = tokenData.username
    * def storedUserId = tokenData.userId
    * print 'Successfully fetch auth token from generateToken.feature - Token:', token
    * print 'Successfully fetch user data from generateToken.feature - Username:', storedUsername
    * print 'Successfully fetch user data from generateToken.feature - UserID:', storedUserId

    * def expectedIsbn = isbnJavascriptDesignPatterns
    * print 'Expected ISBN for Learning JavaScript Design Patterns:', expectedIsbn

    * def booksData = call read('classpath:examples/bookStore/getBooks.feature')
    * def books1 = booksData.isbn0
    * def books2 = booksData.isbn1
    * print 'Successfully fetch first book ISBN from getBooks.feature - ISBN:', books1
    * print 'Successfully fetch second book ISBN from getBooks.feature - ISBN:', books2


Scenario: E2E - Register User, Generate Token, Authorize, get user, save books to user, verify saved books, delete saved books, and verify deletion

  # 1. Verify Authorization Status
    Given path '/Account/v1/Authorized'
    And request { "userName": "#(storedUsername)", "password": "#(password)" }
    When method post
    Then status 200
    * match response == 'true'

  # 2. Save book into user's collection
    Given path 'BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token 
    And request { "userId": "#(storedUserId)", "collectionOfIsbns": [{ "isbn": "#(books1)" }, { "isbn": "#(books2)" }] }
    When method post
    Then status 201
    * match response.books[0].isbn == books1
    * match response.books[1].isbn == books2

  # 3.Verify User Details after Saving Books
    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    * match response.userId == storedUserId
    * match response.username == storedUsername
    * match response.books[0].isbn == books1
    * match response.books[0].title == 'Git Pocket Guide'
    * match response.books[1].isbn == books2
    * match response.books[1].title == 'Learning JavaScript Design Patterns'

  # 4. Update Saved Books from User's Collection
    Given path '/BookStore/v1/Books/' + books1
    And header Authorization = 'Bearer ' + token 
    And request { "userId": "#(storedUserId)", "isbn": "#(books3)" }
    When method put
    Then status 200

  # 5. Verify User Details after Update Saved Books
    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + token 
    When method get
    Then status 200
    * match response.userId == storedUserId
    * match response.username == storedUsername
    * match response.books[0].isbn == books3
    * match response.books[0].title == books3Title
    * match response.books[1].isbn == books2
    * match response.books[1].title == 'Learning JavaScript Design Patterns'

  # 6. Delete generated user to clean up data
    Given path '/Account/v1/User/' + storedUserId
    And header Authorization = 'Bearer ' + token 
    When method delete
    Then status 204
