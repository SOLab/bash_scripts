cd /home/mag/Documents/repos/
wget http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz
tar zxf llvm-3.2.src.tar.gz
cd llvm-3.2.src
./configure --enable-optimized --prefix=/usr/local/
# It is recommended to separate the custom build from the default system
# package.
# Be sure your compiler architecture is same as version of Python you will use
#  e.g. -arch i386 or -arch x86_64.  It might be best to be explicit about this.
export REQUIRES_RTTI=1
sudo make install

cd /home/mag/Documents/repos/
git clone https://github.com/llvmpy/llvmpy.git && cd llvmpy
export LLVM_CONFIG_PATH=/usr/local/bin/llvm-config
$LLVM_CONFIG_PATH --cflags # test llvm-config
export LLVMPY_DYNLINK=1
export CFLAGS="-Wno-strict-aliasing -Wno-unused -Wno-write-strings -Wno-unused-function"
sudo python setup.py install
cd ../; rm -rf llvm-3.2.src*
python -c "import llvm; llvm.test()"

cd /home/mag/Documents/repos/
git clone https://github.com/numba/numba.git && cd numba
sudo pip install -r requirements.txt
sudo python setup.py install
cd ../; rm -rf numba
