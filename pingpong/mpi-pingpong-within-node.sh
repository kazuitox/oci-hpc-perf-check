#!/bin/bash

for i in {0..35}
do
  for j in {0..35}
  do
	  if [ $i = $j ]; then
		  echo skip
		  echo "            1          NA     NA         NA" | tee ${i}_${j}.log
		  echo "      4194304          NA     NA         NA" | tee -a ${i}_${j}.log
		 else
                  echo "$i,$j"
                  mpirun -np 2 \
                  -genv I_MPI_FABRICS=shm:ofi \
		  -genv I_MPI_DEBUG=5 \
		  -genv I_MPI_PIN_PROCESSOR_LIST="$i,$j" \
		  /share/intel/oneapi/mpi/2021.10.0/benchmarks/imb/src_c/IMB-MPI1 pingpong | tee ${i}_${j}.log
            fi
  done
done

echo "" > column.txt
for file in `ls -1 *_0.log |  sort -uV`
do
 FROM=`echo ${file} | cut -d \_ -f 1 | sed 's/.log//'`
 echo "$FROM" >> column.txt
done

for file in `ls -1 *.log | sort -V`
do
 FROM=`echo ${file} | cut -d \_ -f 1`
 echo "$FROM" > ${FROM}_lat.txt
 echo "$FROM" > ${FROM}_tp.txt
done

for file in `ls -1 *.log | sort -V`
do

 FROM=`echo ${file} | cut -d \_ -f 1 | sed 's/.log//'`
 RES_LAT=`grep "            1" ${file} | awk '{print $3}'`
 RES_TP=`grep "      4194304" ${file} | awk '{print $4}'`

 echo "$RES_LAT" >> ${FROM}_lat.txt
 echo "$RES_TP" >> ${FROM}_tp.txt

done
echo
echo "=== MAP =============================="
paste -d, column.txt `ls *_lat.txt | sort -V`  > pingpong-lat-map.csv
paste -d, column.txt `ls *_tp.txt | sort -V`  > pingpong-tp-map.csv
