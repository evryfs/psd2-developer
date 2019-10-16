curl --request POST \
  --url http://127.0.0.1:8731/api-sandbox/v1/sandbox/agreements \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '{"owner":"__CORPORATE_CUSTOMER_NUMBER__","name":"Testavtale 1 ","engagements":[{"customer":"__INSERT_SSN__","account":{"iban":"__CORPORATE_CUSTOMER_NUMBER_ACCOUNT__"},"roles":["VIEW","REGISTER"]}]}'


