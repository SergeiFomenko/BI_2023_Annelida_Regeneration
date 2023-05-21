#!/bin/bash

source activate /home/maxnest/miniconda3/envs/transrate_env

workdir=/home/maxnest/QC

cd $workdir

# INPUT: #
R1=/home/maxnest/Pdum_kraken2_output/Pdum_ref_decontaminated.R1.fastq
R2=/home/maxnest/Pdum_kraken2_output/Pdum_ref_decontaminated.R2.fastq
Contigs=/home/maxnest/Pdum_ref_rnaSPAdes/Pdum_new_ref.rnaSPAdes.renamed.long.fasta
OUTDIR=Pdum_new_ref_rnaSPAdes_TransRate_output

echo "***** TransRate (v1.0.1) began to work with params: *****"
echo "R1: $R1"
echo "R2: $R2"
echo "Assembly: $Contigs"
nohup /home/maxnest/Soft/TransRate_v101/transrate-1.0.1/bin/transrate --assembly=$Contigs --left=$R1 --right=$R2 --threads=24 --output=${workdir}/${OUTDIR}
wait
echo "##### Job is complete #####"