#!/bin/bash
# Ethereum mining for Microsoft Azure
# Original script by Ben Thompson
# Modified and adapted by JP La Torre
echo -e "\e[31;43m***** Installing Drivers and Prerequisites *****\e[0m"
cd
sudo apt-get update
sudo apt-get install software-properties-common gcc make -y
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum ethminer build-essential -y
echo -e "\e[31;43m***** Installing CUDA 8.0 *****\e[0m"
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo apt-get update
sudo apt-get install libboost-all-dev libleveldb-dev libcurl4-openssl-dev libmicrohttpd-dev libminiupnpc-dev libgmp-dev libjsonrpccpp-dev git cmake libcryptopp-dev libjsoncpp-dev libreadline-dev ocl-icd-libopencl1 opencl-headers mesa-common-dev build-essential cuda -y
echo -e "\e[31;43m***** Installing Genoil Miner *****\e[0m"
git clone -b 110 https://github.com/Genoil/cpp-ethereum.git
cd cpp-ethereum/
mkdir build
cd build
cmake -DBUNDLE=cudaminer ..
make –j6
cd
sudo rm -rf cpp-ethereum/
git clone https://github.com/Genoil/cpp-ethereum
cd cpp-ethereum/
mkdir build
cd build
cmake –DETHASHCUDA=ON ..
cmake -DBUNDLE=cudaminer ..
cmake -DETHASHCUDA=ON ..
cmake --build .
cd
cd cpp-ethereum/build/ethminer
echo -e "\e[31;43m***** Done! To start mining do: 'nohup ./ethminer --farm-recheck 200 -U -S us2.ethermine.org:4444 -FS us1.ethermine.org:4444 -O 0x3a1d3E8ad3A2e7B1fC2f93c1beBDbeB15DE3FD23.<RIGNAME> &' *****\e[0m"
