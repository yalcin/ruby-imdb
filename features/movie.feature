Feature: Get movie information
  Scenario: Get movie information and cast list from IMDB
    Given I have movie name called "Fear and Loathing In Las Vegas"
    When I get first entry from result set
    Then "Johnny Depp" should be act as "Raoul Duke"
    And the genres should be "Adventure, Drama"
    And the rating should be a number between 0 and 10
    And the release year should be 1999
    And the poster should be a link to an image
    And the director should be "Terry Gilliam"
    And it should have many photos
    And the writers should be "Hunter S. Thompson, Terry Gilliam, Tony Grisoni, Tod Davies, Alex Cox"
    And the short_description should be "An oddball journalist and his psychopathic lawyer travel to Las Vegas for a series of psychadelic escapades."
    And the movielength should be "118"
  Scenario: Partial date: Some movies have not a full date
    Given I have movie name called "Russian Roulette"
    When I get first entry from result set
    Then the release year should be 2010
  Scenario: Some movies have no released date at all, but a year in the title
    Given I have movie name called "Dr. Horrible's Sing-Along Blog"
    When I get first entry from result set
    Then the release year should be 2008
    And the title should be "Dr. Horrible's Sing-Along Blog"
  Scenario: Title of minor movies is different
    Given I have movie name called "Kunpan: Legend of the Warlord"
    When I get first entry from result set
    Then the title should be "Kun pan"
  Scenario: Whant Original Poster
    Given I have movie name called "L'era glaciale 3 - L'alba dei dinosauri"
    When I get first entry from result set
    Then the poster should be a link to an image
    And the poster should be "http://ia.media-imdb.com/images/M/MV5BMjA4NDI0Mjg4NV5BMl5BanBnXkFtZTcwOTM1NTY0Mg@@.jpg"

