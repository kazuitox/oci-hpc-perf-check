#!/bin/sh
OMPI="openmpi-4.0.3rc4"
export PATH=/usr/mpi/gcc/${OMPI}/bin:$PATH
export LD_LIBRARY_PATH=/usr/mpi/gcc/${OMPI}/lib:$LD_LIBRARY_PATH
LIST=./hosts

#grep rdma /etc/hosts | awk '{print $2}' > ./hosts

   /usr/mpi/gcc/${OMPI}/bin/mpirun --display-map -hostfile ./hosts -mca btl self -x UCX_TLS=rc,self,sm -x HCOLL_ENABLE_MCAST_ALL=0 -mca coll_hcoll_enable 0 -x UCX_IB_TRAFFIC_CLASS=105 -x UCX_IB_GID_INDEX=3 -np 144 /usr/mpi/gcc/${OMPI}/tests/imb/IMB-MPI1 allreduce | tee allreduce.log
