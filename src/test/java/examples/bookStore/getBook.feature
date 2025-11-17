@getBook
Feature: To query specific book by ISBN

  Background:
    * url baseUrl
    * def expectedIsbn = isbnJavascriptDesignPatterns
    * print 'Expected ISBN for Learning JavaScript Design Patterns:', expectedIsbn


  Scenario:  As QA, I can check book’s data with valid user profile
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