curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/customers \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"12085592767","name":"Test Testperson 2","type":"private"}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"12085592767","accountName":"Totalkonto","bban":"74712699947","iban":"NO1874712699947","currency":"NOK","product":"Totalkonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":15796,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"12085592767","accountName":"Regningskonto","bban":"24628359081","iban":"NO8824628359081","currency":"NOK","product":"Regningskonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"12085592767","accountName":"Valutakonto","bban":"41305545238","iban":"NO6041305545238","currency":"EUR","product":"Valutakonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"EUR"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"12085592767","accountName":"Skattetrekkskonto","bban":"87049752626","iban":"NO6687049752626","currency":"NOK","product":"Skattetrekkskonto","cashAccountType":"TAXE","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":98808,"currency":"NOK"}}]}'

curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/card-accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"12085592767","maskedPan":"1234xxxxxxxx4321","currency":"NOK","creditLimit":{"currency":"NOK","amount":1000},"balances":[{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"},{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"}],"cardId":"1","cardIdVNo":"2","accountNumber":"123412341234","expiry":"2020-01-01","name":"Test","product":"Basic Credit","status":"ENABLED"}'