curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/customers \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"23119621380","name":"Test Testperson 5","type":"private"}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"23119621380","accountName":"Totalkonto","bban":"25866265178","iban":"NO6925866265178","currency":"NOK","product":"Totalkonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":1542000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"23119621380","accountName":"Regningskonto","bban":"26451238008","iban":"NO9226451238008","currency":"NOK","product":"Regningskonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":1400,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"23119621380","accountName":"Valutakonto","bban":"10142011621","iban":"NO5710142011621","currency":"EUR","product":"Valutakonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":444223,"currency":"EUR"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"23119621380","accountName":"Skattetrekkskonto","bban":"92346144760","iban":"NO0892346144760","currency":"NOK","product":"Skattetrekkskonto","cashAccountType":"TAXE","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":15123,"currency":"NOK"}}]}'

curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/card-accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"23119621380","maskedPan":"1234xxxxxxxx4321","currency":"NOK","creditLimit":{"currency":"NOK","amount":1000},"balances":[{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"},{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"}],"cardId":"1","cardIdVNo":"2","accountNumber":"123412341234","expiry":"2020-01-01","name":"Test","product":"Basic Credit","status":"ENABLED"}'