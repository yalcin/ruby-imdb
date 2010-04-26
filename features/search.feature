Feature: Search IMDB
  
  Scenario: Search a movie in imdb
  Given I have keyword "asdopfajpoejf" for the search
  #When I doing search
  Then the result should be equal or greater than 1