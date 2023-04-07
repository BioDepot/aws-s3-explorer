#!/bin/bash
serverBucket=$1
storageBucket=$2

#copy the index.html explorer.css explorer.js to serverBucket
aws s3 cp index.html s3://$serverBucket/index.html
aws s3 cp explorer.css s3://$serverBucket/explorer.css
aws s3 cp explorer.js s3://$serverBucket/explorer.js


#fix permissions
aws s3api put-object-acl --bucket $serverBucket --key index.html --acl public-read
aws s3api put-object-acl --bucket $serverBucket --key explorer.css --acl public-read
aws s3api put-object-acl --bucket $serverBucket --key explorer.js --acl public-read

#fix cors for storageBucket
aws s3api put-bucket-cors --bucket $storageBucket --cors-configuration file://cors.json
