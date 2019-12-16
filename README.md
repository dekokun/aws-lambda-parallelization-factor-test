# aws-lambda-parallelization-factor-test

## Setup

### Pre-requisites

- Register for an [AWS ACCOUNT](https://aws.amazon.com/)
- Install and Setup [AWS CLI](https://aws.amazon.com/cli/)
  - Setup: [AWS account and credentials](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html).
- Install pipenv
- Install aws-sam-cli

### Installation

1. Clone the repository

```bash
$ git clone https://github.com/dekokun/aws-lambda-parallelization-factor-test.git
```

2. Change config file

```bash
$ cd aws-lambda-parallelization-factor-test
$ vi config.mk
```

3. Make S3 bucket for lambda deploy

If you already have the bucket, please skip this step.

```bash
$ make setup-s3
```

4. Change Setting


```bash
$ vi config.toml
```

5. deploy with AWS CloudFormation

```bash
$ make deploy
```


