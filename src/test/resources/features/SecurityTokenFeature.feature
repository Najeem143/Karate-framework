@Smoke
Feature: Security Token Tests


Background: 
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"

#Prepare request
Scenario: Generate valid token with valid username and password

And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

#Request with invalid userName
Scenario: Validate token with invalid username

And request 
"""
{
"username": "ssupervisor",
"password": "tek_supervisor"}
"""
When method post
Then status 400
And print response
And assert response.errorMessage == "User not found"

Scenario: validate token with invalid password

And request 
"""
{
"username": "ssupervisor",
"password": "tek_supervisor1"}
"""
When method post
Then status 400
And print response
And assert response.errorMessage == "User not found"


