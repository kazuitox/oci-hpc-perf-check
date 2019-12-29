#!/bin/sh
hostfile_org=/opt/hpc/hostlist.rdma
hostfile=/var/tmp/hostlist.rdma.openmpi
mpi_setting=~/.bashrc_openmpi3
line=`wc -l /opt/hpc/hostlist.rdma | awk '{print $1}'`
np=`expr 36 \* ${line}` 
cat ${hostfile_org} | sed 's/$/ slots=36/' > ${hostfile}

source ${mpi_setting}

mkdir build_linux
cd build_linux

../configure Linux_MPI
make
cd bin

for host in `cat /opt/hpc/hostlist.rdma`
do
    echo ${host}
    mpirun -np 36 ${MPI_FLAGS} -H ${host}:36 ./xhpcg
done

grep VALID HPCG*
