#!/bin/sh
source /etc/opt/oci-hpc/bashrc/.bashrc_openmpi3
LIST=/etc/opt/oci-hpc/hostfile.rdma

MAIN_NODE=`head -1 ${LIST}`

for line in `cat ${LIST} | sed '1d'`
do
 mpirun -H "${MAIN_NODE}:1,${line}:1" -mca btl self -x UCX_TLS=rc,self,sm -x HCOLL_ENABLE_MCAST_ALL=0 -mca coll_hcoll_enable 0 -x UCX_IB_TRAFFIC_CLASS=105 -x UCX_IB_GID_INDEX=3 --cpu-set 0 -np 2 /usr/mpi/gcc/openmpi-3.1.1rc1/tests/imb/IMB-MPI1 pingpong
 echo $line
done
