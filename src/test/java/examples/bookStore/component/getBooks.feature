@getBooks
Feature: To Get All Books

  Background:
    * url baseUrl

  Scenario: To Get All Books and Verify Response Status
    Given path '/BookStore/v1/Books'
    When method get
    Then status 200
    * print 'Total Books Retrieved:', response.books.length
    * match response.books[0].title == 'Git Pocket Guide'
    * match response.books[0].author == 'Richard E. Silverman'
    * match response.books[0].publisher == "O'Reilly Media"
    * match response.books[1].title == 'Learning JavaScript Design Patterns'
    * match response.books[1].author == 'Addy Osmani'
    * match response.books[1].publisher == "O'Reilly Media"
    * def isbn0 = response.books[0].isbn
    * print 'First Book ISBN:', isbn0
    * def isbn1 = response.books[1].isbn
    * print 'Second Book ISBN:', isbn1