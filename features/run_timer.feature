
Feature: Run Timer
  Timer should give players time per turn each,
  when the turn time is finished, it should eat into the time bank
  when that finishes, the current player's turn is skipped, and the next player starts

  Background: start with standard game for this feature
    Given I started a game "Power Grid"
    And time_per_turn is "00:00:10"
    And timebank_per_player is "00:00:15"
    And interlude_per_turn is "00:00:05"
    And number_of_players is "3"
    When I create a new game
    And I enter player details "Minan,Marty,Joe"
    And I start the game

  Scenario: start the round and leave the time running out
    until the end of the round
    When I start the round
    Then I should see "Minan's turn is starting" after 2 second
    Then I should see "Minan's turn now" after 7 seconds
    Then I should see "00:00" after 17 seconds

    Then I should see "Marty's turn is starting" after 32 seconds
    Then I should see "Marty's turn now" after 37 seconds

    Then I should see "Joe's turn is starting" after 62 seconds
    Then I should see "Joe's turn now" after 67 seconds

    Then I should see "The next round is about to start" after 100 seconds
