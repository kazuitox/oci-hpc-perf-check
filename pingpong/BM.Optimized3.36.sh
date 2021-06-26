#!/bin/sh
#source /etc/opt/oci-hpc/bashrc/.bashrc_openmpi3
export PATH=/usr/mpi/gcc/openmpi-4.1.0rc5/bin:$PATH
export LD_LIBRARY_PATH=/usr/mpi/gcc/openmpi-4.1.0rc5/lib:$LD_LIBRARY_PATH
LIST=./hosts

for MAIN_NODE in `cat ${LIST}`
do

 for line in `cat ${LIST}`
 do
  if [ ${MAIN_NODE} = ${line} ]; then
   echo skip
   echo "            1          NA     NA         NA" | tee ${MAIN_NODE}-${line}.log
  else
   echo "${MAIN_NODE} -> $line"
   mpirun -H "${MAIN_NODE}:1,${line}:1"  -mca pml ucx -x UCX_NET_DEVICES=mlx5_2:1 -x UCX_IB_TRAFFIC_CLASS=105 -x UCX_IB_GID_INDEX=3 -x HCOLL_ENABLE_MCAST_ALL=0 -x coll_hcoll_enable=0 --cpu-set 0 -np 2 /usr/mpi/gcc/openmpi-4.1.0rc5/tests/imb/IMB-MPI1 pingpong | tee ${MAIN_NODE}-${line}.log
  fi
 done

done
