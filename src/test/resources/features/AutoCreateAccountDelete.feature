@Regression
Feature: 
Background: Test setup and create new account
* def createAccount = callonce read('GenerateToken.feature')
* def validToken = callonce read('GenerateToken.feature')
* def createdAccountId = createAccount.response.id
And print createAccount
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: successfull delete account
Given path "/api/accounts/delete-account"
And param primaryPersonId = createdAccountId
And header Authorization = "Bearer "+ validToken
When method delete
Then status 200
And assert response == "Account Successfully deleted"
Given path "/api/accounts/delete-account"
And param primaryPersonId = createAccountId
And header Authorization = "Bearer "+ validToken
When method delete
Then status 404
And print response
And assert response.errorMessage == "Account with id "+ createdAccountId + "not exist"
