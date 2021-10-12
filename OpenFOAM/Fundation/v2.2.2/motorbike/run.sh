#!/bin/sh
DIR="backup_`date +%Y-%m-%d_%H_%M`"
./Clean

echo "`date`: Start mesh"
mkdir -p $DIR/mesh
./Mesh 130 52 52
mv log.* $DIR/mesh
echo "`date`: Finished mesh"

echo "`date`: Start setup"
mkdir -p $DIR/setup
./Setup 72
mv log.* $DIR/setup
echo "`date`: Finished setup"

echo "`date`: Start solv"
mkdir -p $DIR/solve
./Solve 72
mv log.* $DIR/solve
echo "`date`: Finished solv"
