#!/bin/sh -ue

from=$1
to=$2
cloudfront_distribution_id=$3

echo "Syncing $from with $to"
aws s3 sync $from $to --no-progress

echo "Invalidating cloudfront distribution"
aws cloudfront create-invalidation --distribution-id $cloudfront_distribution_id --paths "/*"
