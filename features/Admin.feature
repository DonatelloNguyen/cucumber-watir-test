Feature: Admin creates event
Scenario: Admin creates event and check if it shows
Given a user logs in as admin
When admin creates event
Then it should appear on pending
