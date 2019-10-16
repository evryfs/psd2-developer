curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/customers \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'tpp-id: NO-FSA-933012867' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","name":"Test Testperson 4","type":"private"}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","accountName":"Totalkonto","bban":"73787675015","iban":"NO8073787675015","currency":"NOK","product":"Totalkonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":15000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","accountName":"Regningskonto","bban":"61540424684","iban":"NO4661540424684","currency":"NOK","product":"Regningskonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","accountName":"Valutakonto","bban":"45860903421","iban":"NO2545860903421","currency":"EUR","product":"Valutakonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":3326011,"currency":"EUR"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","accountName":"Skattetrekkskonto","bban":"74242359728","iban":"NO5774242359728","currency":"NOK","product":"Skattetrekkskonto","cashAccountType":"TAXE","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":15000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","accountName":"Skattetrekkskonto","bban":"33613979495","iban":"NO8833613979495","currency":"NOK","product":"Skattetrekkskonto","cashAccountType":"TAXE","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":15000,"currency":"NOK"}}]}'

curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/card-accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"20079718492","maskedPan":"1234xxxxxxxx4321","currency":"NOK","creditLimit":{"currency":"NOK","amount":1000},"balances":[{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"EXPECTED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"},{"balanceAmount":{"currency":"NOK","amount":0},"balanceType":"AUTHORISED","referenceDate":"2020-01-01","lastChangeDateTime":"2019-10-14T13:55:45.494Z","lastCommittedTransaction":"test"}],"cardId":"1","cardIdVNo":"2","accountNumber":"123412341234","expiry":"2020-01-01","name":"Test","product":"Basic Credit","status":"ENABLED"}'