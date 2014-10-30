#!/bin/bash

#~ Instructions for installing GDAL and other software dependencies required by Nansat
#~ Ubuntu 12.04.1 LTS (Precise Pangolin)
#~ Ubuntu 12.10 (Quantal Quetzal)
#~ Ubuntu 13.04 (Raring Ringtail)
#~ 
#~ System specifications: ¶
#~ 
#~ uname:
#~ Linux matlab 3.2.0-24-generic #39-Ubuntu SMP Mon May 21 16:52:17 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
#~ Linux MAG-SOLab-Desk 3.5.0-18-generic #29-Ubuntu SMP Fri Oct 19 10:26:51 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
#~ Python: /usr/lib/python2.7/
#~ Commands:
#~ 
#~ You can copy following commands into your favorite editor to create an installation shell script.
#~ Alliteratively you can download this script at the bottom of the page.
#~ Don't forget to revise the script if you don't want some packages to be installed.

#~ Check which Linux you are running
OS=$(lsb_release -is)
VER=$(lsb_release -rs)
echo $OS $VER

#~ Following will install all needed packedges for NANSAT dev under 
#~ Ubuntu 12.04, 12.10 and 13.04
if [ $OS == "Ubuntu" ]  && [ $VER == "12.04" ]
then
	add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
	LIST_OF_APPS="
	build-essential
	cython
	gdal-bin
	libgdal-dev
	libgdal1-dev
	libgeos-3.2.2
	libgeos-dev
	libgrib-api-dev
	libgrib-api-tools
	libgrib2c-dev
	libhdf5-serial-dev
	libjasper-dev
	libjpeg-dev
	libjpeg-turbo8-dev
	libjpeg8-dev
	libnetcdf6
	libnetcdf-dev
	libpng12-dev
	libproj-dev
	psutils
	pyflakes
	python-all-dev
	python-dev
	python-gdal
	python-h5py
	python-matplotlib
	python-mpltoolkits.basemap
	python-pip
	python-psutil
	python-pyproj
	python-rope
	python-scientific
	python-scitools
	python-scipy
	python-sphinx
	python-sympy
	subversion
	"
elif [ $OS == "Ubuntu" ]  && [ $VER == "12.10" ] || [ $VER == "13.04" ]
then
	LIST_OF_APPS="
	build-essential
	cython
	gdal-bin
	libgdal-dev
	libgdal1-dev
	libgeos-3.3.3
	libgeos-dev
	libgrib-api-dev
	libgrib-api-tools
	libgrib2c-dev
	libhdf5-serial-dev
	libjasper-dev
	libjpeg-dev
	libjpeg-turbo8-dev
	libjpeg8-dev
	libnetcdfc7
	libnetcdf-dev
	libpng12-dev
	libproj-dev
	psutils
	pyflakes
	python-all-dev
	python-dev
	python-gdal
	python-h5py
	python-matplotlib
	python-mpltoolkits.basemap
	python-pip
	python-psutil
	python-pyproj
	python-rope
	python-scientific
	python-scitools
	python-scipy
	python-sphinx
	python-sympy
	subversion
	"
fi

#~ update
apt-get update -qq

#~ maintenance and search tools for a Xapian index of Debian packages.
#~ sometimes it crashes on L(X)Ubuntu.
#~ so it is a good idea to rebuild it before any massive installation, or after an upgrade
#~ (You probably won't need this step on normal Ubuntu)
apt-get install -y -q apt-xapian-index
update-apt-xapian-index

#~ install the list of NANSAT-dev dependencies
apt-get install -y -q --reinstall $LIST_OF_APPS

#~ You may want to install
apt-get install -y -q geany geany-plugins # small and fast IDE
/usr/local/bin/pip install --upgrade pip                 # improved Python package installer
/usr/local/bin/pip install --upgrade virtualenv          # a tool to create isolated Python environments
/usr/local/bin/pip install --upgrade netCDF4             # Python/numpy interface to netCDF
/usr/local/bin/pip install --upgrade scikit-image        # a collection of algorithms for image processing
/usr/local/bin/pip install --upgrade ipdb        		 # better introspection with the same interface as the pdb module
