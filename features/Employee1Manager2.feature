Feature: Employee 1 sends request Manager 2 verifies
Scenario: Employee sends request and Manager 2 to check
Given Employee logs in and create an Event
When Manager2 checks list
Then Manager2 should not see the list
