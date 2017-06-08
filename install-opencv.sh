# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y -qq update
sudo apt-get -y -qq upgrade
sudo apt-get -y -qq dist-upgrade
sudo apt-get -y -qq autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y -qq build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y -qq qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y -qq zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y -qq libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y -qq libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y -qq python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y -qq ant default-jdk

# Documentation:
sudo apt-get install -y -qq doxygen


# INSTALL THE LIBRARY (YOU CAN CHANGE '3.2.0' FOR THE LAST STABLE VERSION)

sudo apt-get install -y -qq unzip wget

cd ~/

wget https://github.com/opencv/opencv/archive/master.zip
unzip -qq master.zip
rm master.zip
mv opencv-master OpenCV

wget https://github.com/opencv/opencv_contrib/archive/master.zip
unzip -qq master.zip
rm master.zip
mv opencv_contrib-master opencv_contrib


cd OpenCV
mkdir build
cd build
# cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -D ENABLE_PRECOMPILED_HEADERS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=/home/mag/opencv_contrib/modules/ -D INSTALL_C_EXAMPLES=OFF -DBUILD_EXAMPLES=ON ..
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=/home/mag/opencv_contrib/modules -DBUILD_EXAMPLES=ON ..
make -j8
sudo make install
sudo ldconfig


# EXECUTE SOME OPENCV EXAMPLES AND COMPILE A DEMONSTRATION

# To complete this step, please visit 'http://milq.github.io/install-opencv-ubuntu-debian'.
