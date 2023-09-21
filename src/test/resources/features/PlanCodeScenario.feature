Feature: Get all plan code

Background: 
Given url "https://tek-insurance-api.azurewebsites.net"
* def result callonce read('GenerateToken:featre')
And print result 
#* def validToken = result.response.token


