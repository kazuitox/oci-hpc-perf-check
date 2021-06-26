#!/bin/sh
hostfile_org=/etc/opt/oci-hpc/hostfile.rdma
hostfile=/var/tmp/hostlist.rdma.openmpi
source /usr/mpi/gcc/openmpi-4.1.0rc5/bin/mpivars.sh
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
    mpirun  -mca pml ucx -x UCX_NET_DEVICES=mlx5_2:1 -x UCX_IB_TRAFFIC_CLASS=105 -x UCX_IB_GID_INDEX=3 -x HCOLL_ENABLE_MCAST_ALL=0 -x coll_hcoll_enable=0  -np 36 ${MPI_FLAGS} -H ${host}:36 ./xhpcg
    RESULT_FILE=`ls -1rt HPCG* | tail -1`
    mv ${RESULT_FILE} ${host}_${RESULT_FILE}
    echo "Done"
done

grep VALID *_HPCG*.txt
