Feature: Start Games
  I want to start games with the correct properties and player names

  Scenario Outline: start new game
    Given a game of <name> with <player_num> players
    And players in <player_names>
    And I start a new game
    Then I should see <name>
    And <player_names> are playing
    And I should not see "Player1"
    
    Scenarios: valid, simple inputs
      | name     | player_num | player_names            |
      | Steam    | 4          | Peggy,Marty,Minan,Joe      |
      | Agricola | 5          | Ben,Steven,Wil,Jimmy,Rajan |
