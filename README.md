# Pulpino-for-dummies

## Requirements
* Xilinx Vivado 2018.3
* Git LFS and ssh
* Ubuntu 18.04
```bash
$ sudo apt install python-yaml
```
* Windows 10
```bash
C:\python27-x64\Scripts> pip install pyyaml
```
## Cloning repo
either with ssh
```bash
$ git clone git@github.com:hnkgroup/Pulpino-for-dummies.git
```
or just https (no ssh)
```bash
$ git clone https://github.com/hnkgroup/Pulpino-for-dummies.git
```
then update submodule & cloning ips in pulpino. TL;DR
```bash
$ cd Pulpino-for-dummies
$ git submodule update --init
$ cd pulpino && ./update-ips.py
```
## Building
Open Vivado Project in ***fpga***
