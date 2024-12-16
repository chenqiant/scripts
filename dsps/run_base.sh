set -e  # 设置脚本在遇到错误时立即退出

cd add
./run_base.sh
cd ..

cd addc
./run_base.sh
cd ..

cd biquad
./run_base.sh
cd ..

cd corr
./run_base.sh
cd ..

cd ccorr
./run_base.sh
cd ..

cd conv
./run_base.sh
cd ..

cd dotprod
./run_base.sh
cd ..

cd dotprode
./run_base.sh
cd ..

cd fir
./run_base.sh
cd ..

cd fird
./run_base.sh
cd ..

cd mul
./run_base.sh
cd ..

cd mulc
./run_base.sh
cd ..

cd sqrt
./run_base.sh
cd ..

cd sub
./run_base.sh
cd ..




