@getBookComponent
Feature: To query specific book by ISBN

  Background:
    * url baseUrl


    @validGetBook
  Scenario:  As QA, I can check book’s data with valid user profile
    * def expectedIsbn = isbnJavascriptDesignPatterns
    * print 'Expected ISBN for Learning JavaScript Design Patterns:', expectedIsbn

    Given path '/BookStore/v1/Book'
    * param ISBN = expectedIsbn
    When method get
    Then status 200
    * match response.title == 'Learning JavaScript Design Patterns'
    * match response.author == 'Addy Osmani'
    * match response.publisher == "O'Reilly Media"
    * match response.isbn == expectedIsbn
    * match response.subTitle == "A JavaScript and jQuery Developer's Guide"
    * match response.pages == 254
    * match response.description == "With Learning JavaScript Design Patterns, you'll learn how to write beautiful, structured, and maintainable JavaScript by applying classical and modern design patterns to the language. If you want to keep your code efficient, more manageable, and up-to-da"
    * match response.website == 'http://www.addyosmani.com/resources/essentialjsdesignpatterns/book/'


    @invalidGetBook
  Scenario: As QA, I can check book’s data with invalid isbn
    * def invalidIsbn = dummyIsbn

    Given path '/BookStore/v1/Book'
    * param ISBN = invalidIsbn
    When method get
    Then status 400
    * match response.message == "ISBN supplied is not available in Books Collection!"
    * match response.code == "1205"