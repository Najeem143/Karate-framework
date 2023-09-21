Feature: Create account
@Regression
	Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read("GenerateToken.feature")
    * def validToken = result.response.token
    Given path "/api/accounts/add-primary-account"
   	And header Authorization = "Bearer " + validToken
    And request 
    """
    {
  "id": 0,
  "email": "najeem.afgs@gmail.com",
  "firstName": "Hamza",
  "lastName": "Najeem",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Studen",
  "dateOfBirth": "2023-08-15T17:31:21.245Z",
  "new": true
}
"""
When method post
Then status 201
And print response

  
    
    
