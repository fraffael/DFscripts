#!/bin/bash
#SBATCH -o cat_SLURM.out
#SBATCH -e cat_SLURM.err
#SBATCH -N 1 #--ntasks-per-node=20 #--mem=63G ##esp1
##SBATCH -N 1 #--ntasks-per-node=12 #--mem=31G ##esp
#SBATCH -t 24:00:00
#SBATCH -J catmon
#SBATCH -p esp1


module load nco
module load cdo 

{
for reg in AFR, SAM, SEA, NAM, AUS, CAM, EAS, WAS 

do

cd /home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/$reg/
outdir="/home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/$reg/"


cdo -L -z zip -cat $outdir/rcp85/$reg-22_rcp85_*SPELL_far.nc $outdir/rcp85/$reg-22_rcp85-DF6-farfut.nc
cdo -L -z zip -cat $outdir/rcp85/$reg-22_rcp85_*SPELL_mid.nc $outdir/rcp85/$reg-22_rcp85-DF6-midfut.nc
cdo -L -z zip -cat $outdir/rcp85/$reg-22_rcp85_*SPELL_ref.nc $outdir/rcp85/$reg-22_rcp85-DF6-hist.nc
cdo -L -z zip -cat $outdir/rcp26/$reg-22_rcp26_*SPELL_far.nc $outdir/rcp26/$reg-22_rcp26-DF6-farfut.nc
cdo -L -z zip -cat $outdir/rcp26/$reg-22_rcp26_*SPELL_mid.nc $outdir/rcp26/$reg-22_rcp26-DF6-midfut.nc
cdo -L -z zip -cat $outdir/rcp26/$reg-22_rcp26_*SPELL_ref.nc $outdir/rcp26/$reg-22_rcp26-DF6-hist.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-farfut.nc $outdir/rcp85/$reg-22_rcp85-DF6-farfutENS.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-midfut.nc $outdir/rcp85/$reg-22_rcp85-DF6-midfutENS.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-hist.nc $outdir/rcp85/$reg-22_rcp85-DF6-histENS.nc
cdo -L -z zip -timmean $outdir/rcp26/$reg-22_rcp26-DF6-farfut.nc $outdir/rcp26/$reg-22_rcp26-DF6-farfutENS.nc
cdo -L -z zip -timmean $outdir/rcp26/$reg-22_rcp26-DF6-midfut.nc $outdir/rcp26/$reg-22_rcp26-DF6-midfutENS.nc
cdo -L -z zip -timmean $outdir/rcp26/$reg-22_rcp26-DF6-hist.nc $outdir/rcp26/$reg-22_rcp26-DF6-histENS.nc
cdo -L -z zip -cat $outdir/rcp85/*1.5deg* $outdir/rcp85/$reg-22_rcp85-DF6-GWL1.5.nc
cdo -L -z zip -cat $outdir/rcp85/*2.0deg* $outdir/rcp85/$reg-22_rcp85-DF6-GWL2.0.nc
cdo -L -z zip -cat $outdir/rcp85/*3.0deg* $outdir/rcp85/$reg-22_rcp85-DF6-GWL3.0.nc
cdo -L -z zip -cat $outdir/rcp85/*4.0deg* $outdir/rcp85/$reg-22_rcp85-DF6-GWL4.0.nc
cdo -L -z zip -cat $outdir/rcp26/*1.5deg* $outdir/rcp26/$reg-22_rcp26-DF6-GWL1.5.nc
cdo -L -z zip -cat $outdir/rcp26/*2.0deg* $outdir/rcp26/$reg-22_rcp26-DF6-GWL2.0.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-GWL1.5.nc $outdir/rcp85/$reg-22_rcp85-DF6-GWL1.5ENS.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-GWL2.0.nc $outdir/rcp85/$reg-22_rcp85-DF6-GWL2.0ENS.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-GWL3.0.nc $outdir/rcp85/$reg-22_rcp85-DF6-GWL3.0ENS.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-GWL4.0.nc $outdir/rcp85/$reg-22_rcp85-DF6-GWL4.0ENS.nc
cdo -L -z zip -timmean $outdir/rcp26/$reg-22_rcp26-DF6-GWL1.5.nc $outdir/rcp26/$reg-22_rcp26-DF6-GWL1.5ENS.nc

cdo -L -z zip -cat $outdir/rcp85/$reg-22_rcp85_*SPELL_farch.nc $outdir/rcp85/$reg-22_rcp85-DF6-farch.nc
cdo -L -z zip -cat $outdir/rcp85/$reg-22_rcp85_*SPELL_midch.nc $outdir/rcp85/$reg-22_rcp85-DF6-midch.nc
cdo -L -z zip -cat $outdir/rcp26/$reg-22_rcp26_*SPELL_farch.nc $outdir/rcp26/$reg-22_rcp26-DF6-farch.nc
cdo -L -z zip -cat $outdir/rcp26/$reg-22_rcp26_*SPELL_midch.nc $outdir/rcp26/$reg-22_rcp26-DF6-midch.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-farch.nc $outdir/rcp85/$reg-22_rcp85-DF6-farchENS.nc
cdo -L -z zip -timmean $outdir/rcp85/$reg-22_rcp85-DF6-midch.nc $outdir/rcp85/$reg-22_rcp85-DF6-midchENS.nc
cdo -L -z zip -timmean $outdir/rcp26/$reg-22_rcp26-DF6-farch.nc $outdir/rcp26/$reg-22_rcp26-DF6-farchENS.nc
cdo -L -z zip -timmean $outdir/rcp26/$reg-22_rcp26-DF6-midch.nc $outdir/rcp26/$reg-22_rcp26-DF6-midchENS.nc

done
}
