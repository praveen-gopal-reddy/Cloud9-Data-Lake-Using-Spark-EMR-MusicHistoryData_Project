#!/bin/bash
#creates emr cluster and then executes etl_music_job script
aws emr create-cluster --name "spark-emr-datalake-music" \
    --release-label emr-5.29.0 \
    --applications Name=Spark \
    --log-uri s3://s3bucket-spark-input/logs/ \
    --ec2-attributes KeyName=keypair_for_ec2 \
    --instance-type m5.xlarge \
    --instance-count 3 \
    --bootstrap-actions Path=s3://s3bucket-spark-input/emr_bootstrap.sh \
    --steps Type=Spark,Name="Spark job",ActionOnFailure=CONTINUE,Args=[--deploy-mode,cluster,--master,yarn,s3://s3bucket-spark-input/etl_music_job.py] \
    --use-default-roles ##--auto-terminate