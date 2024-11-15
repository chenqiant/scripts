set -e  # 设置脚本在遇到错误时立即退出

cd add
./run.sh
cd ..

cd addc
./run.sh
cd ..

cd biquad
./run.sh
cd ..

cd corr
./run.sh
cd ..

cd ccorr
./run.sh
cd ..

cd dotprod
./run.sh
cd ..

cd dotprode
./run.sh
cd ..

cd fir
./run.sh
cd ..

cd fird
./run.sh
cd ..

cd mul
./run.sh
cd ..

cd mulc
./run.sh
cd ..

cd sqrt
./run.sh
cd ..

cd sub
./run.sh
cd ..

cd conv
./run.sh
cd ..

cd complicated_dotprod
./run.sh
cd ..

cd simple_dotprod
./run.sh

