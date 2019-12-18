# aws-lambda-parallelization-factor-test

## Setup

### Pre-requisites

- Register for an [AWS ACCOUNT](https://aws.amazon.com/)
- Install and Setup [AWS CLI](https://aws.amazon.com/cli/)
  - Setup: [AWS account and credentials](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html).
- Install pipenv

### Installation

1. Clone the repository

```bash
$ git clone https://github.com/dekokun/aws-lambda-parallelization-factor-test.git
```

2. Change config file

```bash
$ cd aws-lambda-parallelization-factor-test
$ cp config.mk.template config.mk
# fill config exclude `CONFIG_KINESIS_STREAM_NAME`
$ vi config.mk
```

3. Make S3 bucket for lambda deploy

If you already have the bucket, please skip this step.

```bash
$ make setup-s3
```

4. deploy with AWS CloudFormation

```bash
$ make install
$ make deploy
```

5. put records to kinesis

```bash
# fill `CONFIG_KINESIS_STREAM_NAME` field with created kinesis name.
$ vi config.mk
# put records to kinesis
$ make put_records
```
