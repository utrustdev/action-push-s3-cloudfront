# Github Action - Deploy to an S3-backed Cloudfront distribution

Pushes static assets to an S3 bucket, and updates a corresponding Cloudfront
distribution

## Usage

```
jobs:
  deploy:
    steps:
      - name: Deploy to Cloudfront
        uses: utrustdev/actions-push-s3-cloudfront
        with:
          from: build/
          to: s3://bucket-name/path
          cloudfront-distribution-id: XXXXXX
          aws_role: development
          aws_credentials: |
            [default]
            aws_access_key_id = ${{ secrets.AWS_ACCESS_KEY_ID }}
            aws_secret_access_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
            [profile development]
            role_arn = arn:aws:iam::1234567890:role/ci
            region = eu-central-1
            source_profile = default
```
