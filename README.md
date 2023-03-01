# Github Action - Deploy to an S3-backed Cloudfront distribution

Pushes static assets to an S3 bucket, and updates a corresponding Cloudfront
distribution

## Usage

```yaml
jobs:
  deploy:
    steps:
      - name: Deploy to Cloudfront
        uses: utrustdev/actions-push-s3-cloudfront
        with:
          from: build/
          to: s3://bucket-name/path
          cloudfront-distribution-id: XXXXXX

```
