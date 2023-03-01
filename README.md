# Github Action - Deploy to an S3-backed Cloudfront distribution

Pushes static assets to an S3 bucket, and updates a corresponding Cloudfront
distribution

## Usage

```yaml
jobs:
  deploy:
    steps:
      - name: Configure AWS credentials
        id: aws_credentials
        uses: aws-actions/configure-aws-credentials@v1-node16
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: aws-region-1

      - name: Deploy to Cloudfront
        uses: utrustdev/actions-push-s3-cloudfront
        with:
          from: build/
          to: s3://bucket-name/path
          cloudfront-distribution-id: XXXXXX
          aws_role: arn:aws:iam::111111111111:role/my-github-actions-role-test
          aws_region: aws-region-1 # Optional. Will default to eu-central-1
          role-duration-seconds: <value> # Optional. Will default to 1 hour
```
