# 概要
OCI の HPC インスタンスでHPCGを単一ノードで実行し性能のチェックします。

# 対象
Cluster Network でデプロイされた BM.HPC2.36 インスタンス

# 実行方法
計算ノードのどれかにログインし、以下のスクリプトを実行する。
/etc/opt/oci-hpc/hostfile.rdma ファイルにあるノードに対して一台ずつ HPCG が実行されます。
```
$ ./build.sh
```


# 実行例
```
[opc@hpc-node-01 OCI_HPC2_Perf_Check]$ ./build.sh
読み込んだプラグイン:langpacks, ulninfo
パッケージ gcc-c++-4.8.5-44.0.3.el7.x86_64 はインストール済みか最新バージョンです
何もしません
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/main.cpp -o src/main.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/CG.cpp -o src/CG.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/CG_ref.cpp -o src/CG_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/TestCG.cpp -o src/TestCG.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeResidual.cpp -o src/ComputeResidual.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ExchangeHalo.cpp -o src/ExchangeHalo.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/GenerateGeometry.cpp -o src/GenerateGeometry.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/GenerateProblem.cpp -o src/GenerateProblem.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/GenerateProblem_ref.cpp -o src/GenerateProblem_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/CheckProblem.cpp -o src/CheckProblem.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/MixedBaseCounter.cpp -o src/MixedBaseCounter.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/OptimizeProblem.cpp -o src/OptimizeProblem.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ReadHpcgDat.cpp -o src/ReadHpcgDat.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ReportResults.cpp -o src/ReportResults.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/SetupHalo.cpp -o src/SetupHalo.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/SetupHalo_ref.cpp -o src/SetupHalo_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/TestSymmetry.cpp -o src/TestSymmetry.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/TestNorms.cpp -o src/TestNorms.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/WriteProblem.cpp -o src/WriteProblem.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/YAML_Doc.cpp -o src/YAML_Doc.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/YAML_Element.cpp -o src/YAML_Element.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeDotProduct.cpp -o src/ComputeDotProduct.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeDotProduct_ref.cpp -o src/ComputeDotProduct_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/mytimer.cpp -o src/mytimer.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeOptimalShapeXYZ.cpp -o src/ComputeOptimalShapeXYZ.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeSPMV.cpp -o src/ComputeSPMV.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeSPMV_ref.cpp -o src/ComputeSPMV_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeSYMGS.cpp -o src/ComputeSYMGS.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeSYMGS_ref.cpp -o src/ComputeSYMGS_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeWAXPBY.cpp -o src/ComputeWAXPBY.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeWAXPBY_ref.cpp -o src/ComputeWAXPBY_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeMG_ref.cpp -o src/ComputeMG_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeMG.cpp -o src/ComputeMG.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeProlongation_ref.cpp -o src/ComputeProlongation_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/ComputeRestriction_ref.cpp -o src/ComputeRestriction_ref.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/CheckAspectRatio.cpp -o src/CheckAspectRatio.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/OutputFile.cpp -o src/OutputFile.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/GenerateCoarseProblem.cpp -o src/GenerateCoarseProblem.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/init.cpp -o src/init.o
mpicxx -c -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 -I../src ../src/finalize.cpp -o src/finalize.o
mpicxx -DHPCG_NO_OPENMP -I./src -I./src/Linux_MPI  -O3 -ffast-math -ftree-vectorize -ftree-vectorizer-verbose=0 src/main.o src/CG.o src/CG_ref.o src/TestCG.o src/ComputeResidual.o src/ExchangeHalo.o src/GenerateGeometry.o src/GenerateProblem.o src/GenerateProblem_ref.o src/CheckProblem.o src/MixedBaseCounter.o src/OptimizeProblem.o src/ReadHpcgDat.o src/ReportResults.o src/SetupHalo.o src/SetupHalo_ref.o src/TestSymmetry.o src/TestNorms.o src/WriteProblem.o src/YAML_Doc.o src/YAML_Element.o src/ComputeDotProduct.o src/ComputeDotProduct_ref.o src/mytimer.o src/ComputeOptimalShapeXYZ.o src/ComputeSPMV.o src/ComputeSPMV_ref.o src/ComputeSYMGS.o src/ComputeSYMGS_ref.o src/ComputeWAXPBY.o src/ComputeWAXPBY_ref.o src/ComputeMG_ref.o src/ComputeMG.o src/ComputeProlongation_ref.o src/ComputeRestriction_ref.o src/CheckAspectRatio.o src/OutputFile.o src/GenerateCoarseProblem.o src/init.o src/finalize.o  -o bin/xhpcg
Running on hpc-node-01-rdma.local.rdma ...Done
Running on hpc-node-02-rdma.local.rdma ...Done
〜 省略 〜
Running on hpc-node-15-rdma.local.rdma ...Done
Running on hpc-node-16-rdma.local.rdma ...Done
hpc-node-01-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-04-39.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=23.1071
hpc-node-02-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-07-17.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.6171
hpc-node-03-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-09-53.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.9484
hpc-node-04-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-12-28.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.8363
hpc-node-05-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-15-01.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=23.1319
hpc-node-06-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-17-34.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=23.0086
hpc-node-07-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-20-10.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.2268
hpc-node-08-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-22-43.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=23.1532
hpc-node-09-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-25-16.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.9813
hpc-node-10-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-27-50.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.9136
hpc-node-11-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-30-24.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.9752
hpc-node-12-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-33-01.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.8202
hpc-node-13-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-35-34.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.9115
hpc-node-14-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-38-08.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=22.9159
hpc-node-15-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-40-41.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=23.0323
hpc-node-16-rdma.local.rdma_HPCG-Benchmark_3.1_2020-12-16_11-43-14.txt:Final Summary::HPCG result is VALID with a GFLOP/s rating of=23.1455
[opc@hpc-node-01 OCI_HPC2_Perf_Check]$
```

22 GFLOP/s 前後出ていればノードの計算能力は問題ないと言えます。
