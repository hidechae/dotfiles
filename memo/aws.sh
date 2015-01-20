#!/bin/bash

##########
# AWS S3 #
##########

# find ./
aws s3api list-objects --bucket $BUCKET

# ls
aws s3api list-objects --bucket $BUCKET --prefix $DIR --delimiter "/"
