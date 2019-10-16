[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=evryfs/psd2-developer)](https://dependabot.com)

# PSD2 Developer Helper Tool
The helper tool consists of 2 parts:

* tpp-reverse-proxy: reverse proxy used for signing messages and forwarding them to the correct ASPSP endpoint. 
* scripts: a set of curl statements using the tpp-reverse-proxy to post test data to the PSD2 mock data API.

## Disclaimer
Do not use any code you find here in production!

The risks are including but not limited to:
* tpp-reverse-proxy will fail under load.
* tpp-reverse-proxy requires the private key be read directly from a unprotected file, production private keys should be located in a secure vault.
* you should do your own security analysis when implementing the signature standard and not use the one you find in tpp-reverse-proxy.


## Requirements
* [Node.js®](https://nodejs.org/en/) ~8.11.3 LTS
* A unix shell if you want to follow the quick start.


## Quick Start

### Set up tpp-reverse-proxy
Start the tpp-reverse proxy, before you do this you need:
* certificate/public key pem file
* private key pem file
* base url for the sandbox environment 
* replace the command line arguments below.

Run these commands in the shell:

    $ npm install
>
    $ npm start publicKey={INSERT_PATH_TO_CERT} privateKey={INSERT_PATH_TO_PRIVATE_KEY} host=https://somesite.openbanking.com


### Create a user with accounts and card accounts
Modify scripts\init_01078900497_private.sh like this:
* replace all instances of __INSERT_X_REQUEST_ID__ with unique ids.

Make sure the script files have execute rights on your computer:

    $ chmod u+x scripts/*

Run the script to create a user in the sandbox environment:

    $ scripts\init_01078900497_private.sh

You should see some json returned, we recommend checking the mock data api documentation to understand the output.

### Optional: add transactions to an account

Modify scripts\init_transactions_for_a_single_account.sh like this:
* replace all instances of __INSERT_X_REQUEST_ID__ with unique ids.
* replace all instances of __INSERT_BBAN__ with 90412263056
* replaces all instances of __INSERT_IBAN__ with NO2390412263056
* replace all instances of __INSERT_ACCOUNT_ID__ with the id that was returned in the json for the account with BBAN=90412263056 and IBAN=NO2390412263056

Run the script to create transactions:

    $ scripts\init_transactions_for_a_single_account.sh

### Done
You should now be able to see accounts and optionally transactions when accessing the sandbox api using the customer identifier: 01078900497


## tpp-reverse-proxy

A simple reverse proxy used to sign incoming HTTP requests using a self-signed certificate before forwarding the request to a target host.

### Install Node Modules
    $ npm install

### Server
    $ npm start publicKey=C:/cert.pem privateKey=C:/key.pem host=https://somesite.openbanking.com

## Logs

You'll find complete request and response logs in `./dist/logs/access.log`.

## Configuration

You can change the application settings and behavior by editing its configuration found in `./src/configuration.js`.

### configuration.target.host

This is endpoint to proxy the request to, e.g. `https://openbanking.xxxx.no`.

### configuration.target.port

The default port is 8731, but this can be overridden by setting either the NODE_PORT or PORT environment variables


## Scripts

Scripts for creating sandbox data using the mock-data api. The scripts are split into private, corporate with agreements and transactions.

### Private context users
The scripts called init_***********_private.sh can be run independently, you just need to replace __INSERT_X_REQUEST_ID__.
After running one of these scripts the userid indicated by the number in the filename can be used in the sandbox environment.

### Corporate context users and agreements
The script called init_***********_corporate.sh will create corporations/organisations in a corporate context. These are not PSUs.
init_***********_corporate.sh must be run first in the same way as for Private context users.
Then a private context user must exist to connect it to the organizations.
This is done by running  scripts\init_agreements_and_engangements_for_a_corporate_customer.sh 
Before running the script it should be modified in this way:
* replace all instances of __INSERT_X_REQUEST_ID__ with unique ids.
* replace all instances of __CORPORATE_CUSTOMER_NUMBER__ with the customer id returned when running init_***********_corporate.sh
* replace all instances of __CORPORATE_CUSTOMER_NUMBER_ACCOUNT__ with an account returned when running init_***********_corporate.sh
* replace all instances of __INSERT_SSN__ with a customer number returned when running init_***********_private.sh

### Transactions
The scripts called init_transactions_for_******.sh are used to add transactions to accounts and card accounts. 
First select an account already created when initializing a customer.
Before using it Modify the script like this:
* replace all instances of __INSERT_X_REQUEST_ID__ with unique ids.
* replace all instances of __INSERT_BBAN__ with the account BBAN
* replaces all instances of __INSERT_IBAN__ with the account IBAN
* replace all instances of __INSERT_ACCOUNT_ID__ with the account ID returned in json when creating the account.


