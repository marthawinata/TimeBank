@empty
Feature: Join Meetups

  Scenario: Can only join once
    Given I browsed for meetup that I was already part of
    Then I should not see "Join this meetup"

  Scenario: I can propose timings and venue and game to bring
    Given I browsed the meetup I was not part of
    Then I should see "Join this meetup"

    When I join the meetup
    Then I should see "You have joined this meetup"
    When I propose new meetup on "20120201"
    Then I should see "20120201"
    When I propose new meetup on "20120202 5:00 PM"
    Then I should see "20120202 5:00 PM"
    When I propose venue at "joe's place"
    Then I should see "joe's place"
    When I decides to bring "Caylus,Agricola,Dominant Species"
    Then I should see "Caylus,Agricola,Dominant Species"



  Scenario: Discuss Meetups
  Anyone can comments on public meetup as long as invited
    Given I have logged in as guest
    When I visit a boardgame meetup
    And comment on it
    And I click post
    Then I should see my own comment

