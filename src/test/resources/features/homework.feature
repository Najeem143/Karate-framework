Feature: Create account
@Smoke
Background:
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def validToken = result.response.token
    
    Scenario: Create Valid Account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + validToken
    * def generateDataObject = Java.type('api.utility.data.GenerateData')
    * def autoEmail = generateDataObject.getEmail()
    And request 
    """
    {
    "id": 0,
    "email": "#(autoEmail)",
    "title": "Mr.",
    "firstName": "Ahmad",
    "lastName": "Najeem",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "Boss",
    "dateOfBirth": 1691105005964,
    "user": null
    }"""
    When method post
    And status 201
    Then print response
    And assert response.email == autoEmail