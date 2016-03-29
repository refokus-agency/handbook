# SSL with Amazon ELB

_Note: For domains with subdomains be sure to buy the wildcard program_
Connect via ssh to the server, and create a folder ssl in the home of the user.
Then we need to create the csr (certificate signing request).
Unit name, common name should be `yourdomain.com` or `*.yourdomain.com` for subdomains. If asked for a challenge password, leave it blank.

## Step 1
### Automatically (only for server created with bons' generator)
Run the script:
`b-ssl`

### Manually
Type (replace `yourdomain.com` with the site's domain, for subdomains add `*.` before the domain. IE: `*.yourdomain.com`):
`openssl req -sha256 -new -newkey rsa:2048 -nodes -keyout yourdomain.com.key -out yourdomain.com.csr`

To use the private key in ELB we need to convert  `yourdomain.com.key`  to PEM. To do this type:
`openssl rsa -in yourdomain.com.key -outform PEM -out yourdomain.com.pem`

## Step 2
Now we have this files
- __yourdomain.com.pem:__ private key for ELB
- __yourdomain.com.crs:__ certificate request
Give __yourdomain.com.crs__ to the ssl provider and download the new certificate (in apache format). Generally you will have 2 files:
- __[some string].crt:__ public key for ELB
- __[some string with bundle].crt:__ certificate chain for ELB
Now we have all the files we need.

Let's set up the ELB. Go to amazon console and create a new load balancer, add the https listener
Open the port 443 in the load balance
Add the ssl certificate to the 443 listener

- __Private key__ -> use the content of __yourdomain.com.pem__
- __Public key certificate__ -> use the content of __[some string].crt__
- __Certificate Chain__ -> use the content of __[some string with bundle].crt__

## Step 3
We need to redirect all traffic from http to https. Just copy and paste this code in your express server
```javascript
//redirect to https
app.use(function(req, res, next) {
 if(process.env.NODE_ENV == 'production' && (!req.secure) && (req.get('X-Forwarded-Proto') !== 'https')) {
  res.redirect('https://' + req.get('Host') + req.url)
 } else {
  next()
 }
})
```
