Feature: Get movie information
  Scenario: Get movie information and cast list from IMDB
    Given I have movie name called "Fear and Loathing In Las Vegas"
    When I get first entry from result set
    Then "Johnny Depp" should be act as "Raoul Duke"
    And the genres should be "Adventure, Drama"
    And the rating should be a number between 0 and 10
    And the release year should be 1998
    And the poster should be a link to an image
    And the director should be "Terry Gilliam"
    And it should have many photos
    And the writers should be "Hunter S. Thompson, Terry Gilliam, Tony Grisoni, Tod Davies, Alex Cox"
    And the short_description should be "An oddball journalist and his psychopathic lawyer travel to Las Vegas for a series of psychadelic escapades."
  Scenario: Partial date: Some movies have not a full date
    Given I have movie name called "Russian Roulette"
    When I get first entry from result set
    And the release year should be 2010

