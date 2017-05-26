#!/usr/bin/env bash

# Run Haplotype Caller on genome data on a GCS Dataproc cluster. Data is in HDFS.

. utils.sh

time_gatk "HaplotypeCallerSpark -I hdfs:///user/$USER/q4_spark_eval/out/bqsr-sharded -R hdfs:///user/$USER/q4_spark_eval/human_g1k_v37.2bit -O hdfs:///user/$USER/q4_spark_eval/out/WGS-G94982-NA12878.vcf -pairHMM AVX_LOGLESS_CACHING" 64 1 8g 4g
