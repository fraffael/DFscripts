#!/bin/bash

source /home/netapp-clima/users/ggiulian/minter-19.sh
cd /home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/EUR-11

inpdir=/home/netapp-clima-scratch/fraffael/SPI-ATLAS/CORDEX/EUR-11/fatto/

#-----------------PARAMETERS--------------------#
syear=1971

list=$(eval ls ${inpdir}/*_SPI6.nc)

for nfile in $list
do

./dspell_minter19.x $nfile $syear

name="${nfile:0:-13}.nc"
base=$(basename "$name" .nc)
echo $name
echo $base
reff="${nfile:0:-3}_SPELL_ref.nc"
midf="${nfile:0:-3}_SPELL_mid.nc"
farf="${nfile:0:-3}_SPELL_far.nc"
midfch="${nfile:0:-3}_SPELL_midch.nc"
farfch="${nfile:0:-3}_SPELL_farch.nc"
cdo -L -z zip -griddes $nfile > grid.$base
cdo -L -z zip -divc,2 -timsum -selyear,1995/2014 -setgrid,grid.$base ${nfile} $reff
cdo -L -z zip -divc,2 -timsum -selyear,2041/2060 -setgrid,grid.$base ${nfile} $midf
cdo -L -z zip -divc,2 -timsum -selyear,2080/2099 -setgrid,grid.$base ${nfile} $farf

cdo -L -z zip sub $midf $reff $midfch
cdo -L -z zip sub $farf $reff $farfch

done
