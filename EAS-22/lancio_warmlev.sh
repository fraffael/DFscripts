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
#source /home/netapp-clima/users/ggiulian/minter-19.sh
cd /home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/AFR/

inpdir=/home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/AFR/

#-----------------PARAMETERS--------------------#

list=$(eval ls ${inpdir}/rcp85/AFR-22_rcp85*SPELL.nc)

for nfile in $list
do
#for i in {1..30}
#do

./warming-levels-match85-1861 ${nfile}
./warming-levels-match85 ${nfile}

done
#done
#cdo cat ${nfile:0:-3}_member_red*.nc ${nfile}_cat
#ncpdq -a time,record ${nfile}_cat ${nfile}_catswap
#ncrename -d record,member ${nfile}_catswap ${nfile:0:-3}_SPELL.nc
#rm ${nfile}_cat ${nfile}_catswap
