#!/bin/bash
  
source /home/netapp-clima/users/ggiulian/minter-19.sh
cd /home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/AFR/

inpdir=/home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/AFR/

#-----------------PARAMETERS--------------------#

nfile=AFR-22_rcp26_spi6_1970-2098.nc   #-----> File name
#nfile=AFR-22_rcp85_spi6_1970-2099.nc   #-----> File name
syear=1970                 #-----> First year of input dataset


#list=$(eval ls ${inpdir}/spiR12_*)

#cp ${nfile} ${nfile}_temp
#for i in {1..17}
for i in {1..21}
do
########## Spi variable should be named as "SPI-6"#################
cdo sellevel,$i $nfile ${nfile:0:-3}_member${i}.nc
ncwa -a member ${nfile:0:-3}_member${i}.nc ${nfile:0:-3}_member_red${i}.nc
./dspell_minter19.x  ${nfile:0:-3}_member_red${i}.nc $syear

done
################### esco cosi' poi posso lanciare il "lancio_warmlev.sh"
