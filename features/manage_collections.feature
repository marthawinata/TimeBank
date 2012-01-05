@empty
Feature: Manage Collections
  Players can add manually and/or import collections from BGG

  Scenario: Add 2 games, remove 1 game
    Given I wnat to propose a meetup
    When I specify the date "20120101"
    And the games I will bring
    And I specify the venue "marty's place"
    And I invite guests
    Then I should see "Enter guest emails"
    When I entered "marthawinata@gmail.com" as guests
    And continue sending email
    Then I should see "Invite has been sent to marthawinata@gmail.com"
    When I confirm the meetup
    Then I should see "20120101"
    And I should see "marty's place"
    And I should see "Google Maps"

  Scenario: Importing games from bgg
