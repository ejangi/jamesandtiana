Feature: Manage users
In order to [goal]
[stakeholder]
wants [behaviour]
Scenario: Register new user
Given the following roles:
|name|
|admin|
And I am on the new user page
When I fill in "Username" with "username 1"
And I fill in "Email" with "example@example.com"
And I fill in "Password" with "secret"
And I fill in "Password confirmation" with "secret"
And I check "admin"
And I press "Create"
Then I should see "username 1"
And I should see "example@example.com"
And I should see "admin"
Scenario: Delete user
Given the following users:
|username |email|password|password_confirmation|role_ids|
|username 1|email1@example.com|secret|secret|1|
|username 2|email2@example.com|secret|secret|2|
|username 3|email3@example.com|secret|secret|2|
|username 4|email4@example.com|secret|secret|2|
When I delete the 3rd user
Then I should see the following users:
|Username |Email|
|username 1|email1@example.com|
|username 2|email2@example.com|
|username 4|email4@example.com|