#~ For the GUI
#~ sudo aptitude install --without-recommends xfce4

#~ NVIDIA Drivers
#~ sudo add-apt-repository ppa:xorg-edgers/ppa
#~ sudo apt-get update
#~ sudo apt-get install nvidia-current nvidia-settings

#~ CUDA

sudo apt-get --purge remove nvidia-* cuda*
sudo pip uninstall pyopencl

sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev

cd ~/Documents/repos/solab/PySOL; [ ! -d CUDA ] && mkdir -p CUDA; cd CUDA

sudo service lightdm stop
sudo killall Xorg

#~  Ubu 12.04

		#~ Follow
		#~ http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-linux/index.html
		#~ http://sn0v.wordpress.com/2012/12/07/installing-cuda-5-on-ubuntu-12-04/
		#~ http://vasir.net/blog/opencl/installing-cuda-opencl-pyopencl-on-aws-ec2
		
		#~ wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1204/x86_64/cuda-repo-ubuntu1204_5.5-0_amd64.deb
		#~ sudo dpkg -i cuda-repo-ubuntu1204_5.5-0_amd64.deb
		#~ sudo apt-get update
		#~ sudo apt-get install cuda
		#~ 
		#~ export PATH=/usr/local/cuda-5.5/bin:$PATH
		#~ export LD_LIBRARY_PATH=/usr/local/cuda-5.5/lib64:$LD_LIBRARY_PATH
		#~ 
		#~ cuda-install-samples-5.5.sh .
		#~ 
		#~ cd NVIDIA_CUDA-5.5_Samples/1_Utilities/deviceQuery
		#~ make
		#~ ./deviceQuery
		#~ 
		#~ sudo apt-get install opencl-headers
		#~ sudo pip install mako
		#~ 
		#~ wget https://pypi.python.org/packages/source/p/pyopencl/pyopencl-2013.2.tar.gz
		#~ sudo pip install pyopencl-2013.2.tar.gz
		#~ 
		#~ 


#~  Ubu 14.04 old

#~ Follow
#~ http://askubuntu.com/questions/451672/installing-and-testing-cuda-in-ubuntu-14-04

#~ wget http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run
#~ sudo ./cuda_6.5.14_linux_64.run -extract=/home/mag/Documents/repos/solab/PySOL/CUDA/nvidia_installers
wget http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_7.0.28_linux.run
sudo ./cuda_7.0.28_linux.run -extract=/home/mag/Documents/repos/solab/PySOL/CUDA/nvidia_installers
cd ~/Documents/repos/solab/PySOL/CUDA/nvidia_installers

#~ sudo ./NVIDIA-Linux-x86_64-340.29.run
sudo ./NVIDIA-Linux-x86_64-346.46.run

sudo ldconfig -v | grep opencl
sudo modprobe nvidia

#~ sudo ./cuda-linux64-rel-6.5.14-18749181.run
sudo ./cuda-linux64-rel-7.0.28-19326674.run

#~ Put into the ~/.baschrc
vim ~/.bashrc
export PATH=/usr/local/cuda-7.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH
source ~/.bashrc 

#~ sudo ./cuda-samples-linux-6.5.14-18745345.run
sudo ./cuda-samples-linux-7.0.28-19326674.run

cd /usr/local/cuda/samples
sudo chown -R mag:mag .
cd 1_Utilities/deviceQuery
make
./deviceQuery

sudo service lightdm start

lsmod | grep nv



#~ wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_6.5-14_amd64.deb
#~ sudo dpkg -i cuda-repo-ubuntu1404_6.5-14_amd64.deb
#~ sudo apt-get update
#~ sudo apt-get install cuda
#~ 
#~ 
#~ cuda-install-samples-6.5.sh .
#~ 
#~ cd NVIDIA_CUDA-6.5_Samples/1_Utilities/deviceQuery
#~ make
#~ ./deviceQuery

sudo apt-get install libboost-all-dev

sudo apt-get install opencl-headers libffi-dev
sudo -H pip install --upgrade mako six cffi decorator 


#~ sudo cp /usr/lib/x86_64-linux-gnu/libnvidia-opencl.so.1 /usr/lib/libOpenCL.so # needeed by new pyopencl-2014.1
#~ sudo ldconfig

#~ wget https://pypi.python.org/packages/source/p/pyopencl/pyopencl-2014.1.tar.gz
#~ sudo pip install --upgrade pyopencl-2014.1.tar.gz

#~ http://stackoverflow.com/questions/21215024/pyopencl-errror-undefined-symbol-clcreatesubdevices
cd ~/Documents/repos/solab/PySOL/CUDA/

curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python
git clone --recursive https://github.com/pyopencl/pyopencl.git; cd pyopencl
python configure.py
if grep -Fxq "CL_PRETEND_VERSION " siteconf.py
	then
		echo "CL_PRETEND_VERSION already set in siteconf"
	else
		echo "CL_PRETEND_VERSION = '1.1'" >> siteconf.py
fi
sudo -H pip install .
#~ sudo python setup.py build
#~ sudo python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ tar xfz pyopencl-2014.1.tar.gz
#~ cd pyopencl-2014.1/
#~ python configure.py --boost-inc-dir=/usr/include/boost --boost-lib-dir=/usr/lib --no-use-shipped-boost --cl-inc-dir=/usr/local/cuda-6.5/include --cl-lib-dir=/usr/lib/nvidia-340 --cl-libname=OpenCL
#~ make
#~ sudo make install




#~  Ubu 14.04 NEW
#~ https://developer.nvidia.com/cuda-downloads

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.0-28_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.0-28_amd64.deb
sudo apt-get update
sudo apt-get install cuda

export PATH=/usr/local/cuda-7.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH

cd /usr/local/cuda-7.0/samples/1_Utilities/deviceQuery
make
./deviceQuery

sudo apt-get install opencl-headers
sudo pip install mako

sudo pip install --upgrade pyopencl



