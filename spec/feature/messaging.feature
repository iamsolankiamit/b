Feature: Usersshould be able to message each other
  Scenario: Guest sends a message to Host
    When I select a Host
    And write a message
    Then the Host should be able to recieve it
