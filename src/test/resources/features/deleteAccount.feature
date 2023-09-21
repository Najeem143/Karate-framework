@Regression
Feature: Create account

Background:
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def validToken = result.response.token
    Scenario: Delete an account
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = 9931
    And header Authorization = "Bearer "+ validToken 
    When method delete
    And status 200
    Then print response 
    Scenario: Delete an account that does not exist
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = 9931
    And header Authorization = "Bearer "+ validToken 
    When method delete
    And status 404
    Then print response