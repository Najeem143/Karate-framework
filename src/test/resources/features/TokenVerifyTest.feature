@Smoke
Feature: Token Veify Feature

Background: 
 Given url "https://tek-insurance-api.azurewebsites.net"

 Scenario: Verify a valid token
 And path "/api/token"
 And request {"username": "supervisor","password": "tek_supervisor"}
 When method post
 Then status 200
 And print response
 Then path "/api/token/verify"
 And param username = "supervisor"
 And param token = response.token
 When method get
 Then status 200
 And print response
 And assert response == 'true'
 
 
 Scenario: Validate a valid token and invalid username.
 And path "/api/token"
 And request {"username": "supervisor","password": "tek_supervisor"}
 When method post
 Then status 200
 And print response
 Then path "/api/token/verify"
 And param username = "Wrong username"
 And param token = response.token
 When method get
 Then status 400 
 And print response
 
 
 Scenario: Invalid token
 Then path "/api/token/verify"
 And param username = "supervisor"
 And param token = "expired token"
 When method get
 Then status 400
 And print response

 
 