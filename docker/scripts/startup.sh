#!/bin/bash

echo "Get credentials"
export AWS_CREDENTIALS=`curl -s 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI`
export AWS_ACCESS_KEY_ID=`echo ${AWS_CREDENTIALS} | jq -r .AccessKeyId`
export AWS_SECRET_ACCESS_KEY=`echo ${AWS_CREDENTIALS} | jq -r .SecretAccessKey`
export AWS_TOKEN=`echo ${AWS_CREDENTIALS} | jq -r .Token`

echo "Start openresty."
/usr/bin/openresty -g "daemon off;"
