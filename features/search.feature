Feature: Search IMDB
  
  Scenario: Search a movie in imdb
  Given I have keyword "District 9" for the search
  Then the result should be equal or greater than 1