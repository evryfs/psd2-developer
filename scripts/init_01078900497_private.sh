curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/customers \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id:__INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"01078900497","name":"Test Testperson 1","type":"private"}'

curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id:__INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"01078900497","accountName":"Brukskonto","bban":"90412263056","iban":"NO2390412263056","currency":"NOK","product":"Brukskonto","cashAccountType":"TAXE","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"NOK"}}]}'
  
  curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id:__INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"01078900497","accountName":"Regningskonto","bban":"90412329715","iban":"NO6590412329715","currency":"NOK","product":"Regningskonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"NOK"}}]}'
  
  curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id:__INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"01078900497","accountName":"Sparekonto","bban":"90522037388","iban":"NO3390522037388","currency":"NOK","product":"Sparekonto","cashAccountType":"SVGS","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"NOK"}}]}'
  
  curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id:__INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"01078900497","accountName":"Valutakonto EUR","bban":"83960706687","iban":"NO0983960706687","currency":"EUR","product":"Valutakonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"EUR"}}]}'
  
  curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/card-accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id:__INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"01078900497","maskedPan":"1234xxxxxxxx4321","currency":"NOK","creditLimit":{"currency":"NOK","amount":1000},"balances":[{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"},{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"}],"cardId":"1","cardIdVNo":"2","accountNumber":"123412341234","expiry":"2020-01-01","name":"Test","product":"Basic Credit","status":"ENABLED"}'
  
  