curl --request POST \
  --url 'http://127.0.0.1:8731/api-sandbox/v1/sandbox/card-accounts/__INSERT_CARD_ACCOUNT_ID__/transactions' \
  --header 'accept: application/json' \
  --header 'accept-charset: utf-8' \
  --header 'accept-encoding: deflate, gzip;q=1.0, *;q=0.5' \
  --header 'accept-language: en-US,en;q=0.7,nb;q=0.3' \
  --header 'Content-Type: application/json; charset=UTF-8' \
  --header 'host: localhost' \
  --header 'x-request-id: __INSERT_X_REQUEST_ID__' \
  --data '[{"cardTransactionId":"test-1","terminalId":"tid","bookingDate":"2019-05-08","transactionDate":"2019-05-08","transactionAmount":{"currency":"NOK","amount":100},"originalAmount":{"currency":"NOK","amount":100},"merchantCategoryCode":"BOB","markupFee":{"currency":"NOK","amount":10},"markupFeePercentage":"20","cardAcceptorId":"","cardAcceptorAddress":{},"maskedPan":"","transactionDetails":"","invoiced":"","proprietaryBankTransactionCode":""},{"cardTransactionId":"test-2","terminalId":"tid","bookingDate":"2019-05-08","transactionDate":"2019-05-08","transactionAmount":{"currency":"NOK","amount":1000},"originalAmount":{"currency":"NOK","amount":1000},"merchantCategoryCode":"TEST","markupFee":{"currency":"NOK","amount":15},"markupFeePercentage":"30","cardAcceptorId":"","cardAcceptorAddress":{},"maskedPan":"","transactionDetails":"","invoiced":"","proprietaryBankTransactionCode":""}]'