#!/bin/bash

set -eu

if [[ "$#" -lt 3 ]]; then
    echo "Please provide: local directory of GATK build, cluster name, output dir on the cluster"
    echo "                reference location, "
    exit 1
fi

GATK_DIR=$1
CLUSTER_NAME=$2
MASTER_NODE="hdfs://""$CLUSTER_NAME""-m:8020"
OUTPUT_DIR=$3

PROJECT_OUTPUT_DIR="$MASTER_NODE"/"$OUTPUT_DIR"

export GATK_DIR
export CLUSTER_NAME
export MASTER_NODE
export PROJECT_OUTPUT_DIR


##########
REFERENCE_IMG_LOCATION=/reference/Homo_sapiens_assembly38.fasta.img
TWOBIT_REFERENCE_LOCATION="$MASTER_NODE"/reference/Homo_sapiens_assembly38.2bit
REFERENCE_LOCATION="$MASTER_NODE"/reference/Homo_sapiens_assembly38.fasta
SKIP_INTERVAL_LIST="$MASTER_NODE"/reference/GRCh38.kill.intervals

if [[ "$#" -eq 4 ]]; then
	INPUT_BAM="$MASTER_NODE""/data/""$4"
else
	INPUT_BAM="$MASTER_NODE"/data/NA12878_PCR-_30X.bam
fi

export REFERENCE_IMG_LOCATION
export TWOBIT_REFERENCE_LOCATION
export REFERENCE_LOCATION
export SKIP_INTERVAL_LIST
export INPUT_BAM
##########



./scanBam.sh

./assembly.sh

./alignAssembly.sh

./callVariants.sh
