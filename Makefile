CONFIG = config.mk
include $(CONFIG)

OUTPUT_TEMPLATE := output.yml
INPUT_TEMPATE := template.yml

AWS := aws cloudformation

.PHONY: deploy
deploy: $(OUTPUT_TEMPLATE)
	$(AWS) deploy \
		--template-file $< \
		--stack-name $(CONFIG_CLOUDFORMATION_STACK_NAME) \
		--capabilities CAPABILITY_IAM

$(OUTPUT_TEMPLATE): $(INPUT_TEMPATE) src/index.py
	$(AWS) package \
		--template-file $< \
		--s3-bucket $(CONFIG_CLOUDFORMATION_PACKAGE_S3_BUCKET_NAME) \
		--s3-prefix $(CONFIG_CLOUDFORMATION_PACKAGE_S3_PREFIX) \
		--output-template-file $@

.PHONY: setup-s3
setup-s3:
	aws s3 mb s3://$(CONFIG_CLOUDFORMATION_PACKAGE_S3_BUCKET_NAME)

.PHONY: install
install:
	pipenv install

.PHONY: put_records
put_records:
	pipenv run python put_record.py $(CONFIG_KINESIS_STREAM_NAME) 1000
