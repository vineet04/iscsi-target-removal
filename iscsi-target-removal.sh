#!/bin/bash

#############################################
#Script to removal iscsi target connection  #
#on Red Hat Enterprise Linux 7              #
#From Vineet Sinha                          #      
#############################################


echo -e "\t\t \n ##### Remove backstores #####"

for i in `targetcli ls /backstores/block/  | grep -v Storage | awk '{print $2}'`; do targetcli /backstores/block/ delete $i;done

echo -e "\t\t \n ##### Remove Iscsi server connection #####"

for i in `targetcli ls /iscsi | grep -B1 tpg1 |grep -v tpg1 | awk '{print $2}'`;do targetcli /iscsi delete $i;done

echo -e "\t\t \n ### Verify no backstores and iscsi connection exist ###"

targetcli ls

exit

