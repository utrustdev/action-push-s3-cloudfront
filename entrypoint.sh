#!/bin/sh -ue

from=$1
to=$2
cloudfront_distribution_id=$3
aws_credentials="$4"
aws_role=$5

mkdir -p $HOME/.aws
echo -e "$aws_credentials" > $HOME/.aws/config

cat $HOME/.aws/config

echo "Syncing $from with $to"
aws s3 sync $from $to --no-progress --profile $aws_role

echo "Invalidating cloudfront distribution"
aws cloudfront create-invalidation --distribution-id $cloudfront_distribution_id --paths "/*" --profile $aws_role
