Feature: Get movie information
  Scenario: Get movie information and cast list from IMDB
  Given I have movie name called "Fear and Loathing In Las Vegas"
  When I get first entry from result set
  Then "Johnny Depp" should be act as "Raoul Duke"