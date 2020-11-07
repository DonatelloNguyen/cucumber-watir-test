Feature: Admin recreates event but date picker shows blank
Scenario: Admin recreates event
Given Admin creates 2nd Event
When Admin adds 2nd event
Then Date picker should not show blank
