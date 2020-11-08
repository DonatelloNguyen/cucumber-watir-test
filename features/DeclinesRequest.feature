Feature: Manager declines Request
Scenario: Manager Select and declines request
Given Employee logs in and create an Event
When Manager checks list
Then Manager declines the request
