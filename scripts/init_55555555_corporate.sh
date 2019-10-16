curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/customers \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"55555555","name":"Testfirma 4","type":"corporate"}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"55555555","accountName":"Driftskonto","bban":"43427943323","iban":"NO6243427943323","currency":"NOK","product":"Totalkonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":30000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"55555555","accountName":"Regningskonto","bban":"70564868510","iban":"NO7170564868510","currency":"NOK","product":"Regningskonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":10000,"currency":"NOK"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"55555555","accountName":"Valutakonto","bban":"79262930711","iban":"NO5379262930711","currency":"EUR","product":"Valutakonto","cashAccountType":"CACC","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":3326011,"currency":"EUR"}}]}'

curl  --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/accounts \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"customerNumber":"55555555","accountName":"Skattetrekkskonto","bban":"86116203229","iban":"NO5386116203229","currency":"NOK","product":"Skattetrekkskonto","cashAccountType":"TAXE","creditLine":0,"balances":[{"balanceType":"EXPECTED","balanceAmount":{"amount":15000,"currency":"NOK"}}]}'

