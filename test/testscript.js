var request = require('request')
const exec = require('child_process').exec

baseUrl = 'http://127.0.0.1:8731/api-sandbox/v1/sandbox'

headers = {
    'accept': 'application/json', 
    'accept-charset': 'utf-8', 
    'accept-encoding': 'deflate, gzip;q=1.0, *;q=0.5', 
    'accept-language': 'en-US,en;q=0.7,nb;q=0.3', 
    'Content-Type': 'application/json; charset=UTF-8', 
    'host': 'localhost', 
    'x-request-id':'TEST_SCRIPT_REQUEST_ID'
}

console.log("Cleaning")
deleteExisting(baseUrl, headers, () => {
    console.log("Done cleaning up, running script")

    exec('sh scripts/init_01078900497_private.sh',
        (error, stdout, stderr) => {
            console.log(stdout);

            expect = '"customerNumber":"01078900497","customerType":"private","customerName":"Test Testperson 1"' //This may be too specific, but it will have to do for now.
            if(!stdout.includes(expect)) {
                
                console.log("Wrong data returned, expected :" + expect)
                process.exit(1)
            } 
            else if(error !== null) {
                console.log(`Test Failed with error: ${error}`);
                console.log(stderr);
                process.exit(1)
            }
            else {
                console.log("Test successful!")
            }
        }); 
})


  function deleteExisting(baseUrl,headers, callback) {
    options = {
        uri: baseUrl+ '/customers',
        headers: headers
    }
    
    request(
        options,
        handleError(function (body) {

                customers = JSON.parse(body)
                ids = customers.map((customer) => {
                    return customer.customerId
                } )

                deleteCustomers(baseUrl, headers, ids, callback)
      }))
  }

  function deleteCustomers(baseUrl, headers, ids, callback) {

    if(ids.length > 0) {
        var id = ids[0];
        var next = ids.slice(1);

        options = {
            uri: baseUrl+ '/customers/'+id,
            method: 'DELETE',
            headers: headers
        }

        request(
            options,
            handleError(function (body) {
                console.log("deleted id: " + id)
                deleteCustomers(baseUrl, headers, next, callback)
        }))
    }
    else {
        callback()
    }
    
  }


  function handleError(callback) {
      return function (error, response, body) {

        if(error) {
            console.log("Error when fetching users. Cannot continue test.")
            console.log('error:', error)
            console.log('statusCode:', response && response.statusCode)
            console.log('body:', body)
            process.exit(1)
        }
        else {
            callback(body)
        }
    }
  }