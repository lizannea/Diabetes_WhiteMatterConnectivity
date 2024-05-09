#!/bin/bash
#SBATCH --mail-type=ALL 			# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=larnoldy@swin.edu.au	# email address

#Simple loop to send off fmriprep job for all subjs in a list
bidsdir="/fred/oz251/Diabetes/conversion_LA"
codedir="/fred/oz251/Diabetes/conversion_LA/code/LA/fmriprep"
logdir="/fred/oz251/Diabetes/derivatives/LA/fmriprep/log/"

#make deriv/log dir for analysis
if [ ! -d ${logdir} ]; then
mkdir -p ${logdir}
fi

cd ${bidsdir}
ls -d sub-* > ${logdir}/pptlist.txt


for subj in `cat ${logdir}/pptlist.txt` 
do

subj_id=${subj:4}
echo "sending jobs for ${subj_id}" 
sbatch ${codedir}/fmriprep_sbatch_anat_script_D.sh ${subj_id}

done