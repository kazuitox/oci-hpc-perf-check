#!/bin/sh
hostfile_org=/etc/opt/oci-hpc/hostfile.rdma
hostfile=/var/tmp/hostlist.rdma.openmpi
export PATH=/nfs/scratch/opt/ibm/platform_mpi/bin:$PATH
export LD_LIBRARY_PATH=/nfs/scratch/opt/ibm/platform_mpi/lib:$LD_LIBRARY_PATH

line=`wc -l ${hostfile_org} | awk '{print $1}'`
np=`expr 36 \* ${line}`

cat ${hostfile_org} | sed 's/$/ slots=36/' > ${hostfile}

sudo yum -y install gcc-c++

#source ${mpi_setting}

mkdir build_linux
cd build_linux

../configure Linux_MPI
make
cd bin

for host in `cat ${hostfile_org}`
do
    echo -n "Running on ${host} ..."
    #mpirun  -mca pml ucx -x UCX_NET_DEVICES=mlx5_2:1 -x UCX_IB_TRAFFIC_CLASS=105 -x UCX_IB_GID_INDEX=3 -x HCOLL_ENABLE_MCAST_ALL=0 -x coll_hcoll_enable=0  -np 36 ${MPI_FLAGS} -H ${host}:36 ./xhpcg
    mpirun -d -v -prot -intra=shm -e MPI_HASIC_UDAPL=ofa-v2-cma-roe-ens800f0 -UDAPL -e MPI_FLAGS=y -hostlist ${host} -cpu_bind=MAP_CPU:0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35 -np 36 ./xhpcg
    RESULT_FILE=`ls -1rt HPCG* | tail -1`
    mv ${RESULT_FILE} ${host}_${RESULT_FILE}
    echo "Done"
done

grep VALID *_HPCG*.txt
