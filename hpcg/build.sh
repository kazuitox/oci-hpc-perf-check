#!/bin/sh
hostfile_org=/etc/opt/oci-hpc/hostfile.rdma
hostfile=/var/tmp/hostlist.rdma.openmpi
mpi_setting=/usr/mpi/gcc/openmpi-4.0.3rc4/bin/mpivars.sh
line=`wc -l ${hostfile_org} | awk '{print $1}'`
np=`expr 36 \* ${line}` 

cat ${hostfile_org} | sed 's/$/ slots=36/' > ${hostfile}

sudo yum -y install gcc-c++

source ${mpi_setting}

mkdir build_linux
cd build_linux

../configure Linux_MPI
make
cd bin

for host in `cat ${hostfile_org}`
do
    echo -n "Running on ${host} ..."
    mpirun -np 36 ${MPI_FLAGS} -H ${host}:36 ./xhpcg
    RESULT_FILE=`ls -1rt HPCG* | tail -1`
    mv ${RESULT_FILE} ${host}_${RESULT_FILE}
    echo "Done"
done

grep VALID *_HPCG*.txt
