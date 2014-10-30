#~ Uninstall everything
	LIST_OF_APPS="
	ipython
	pyflakes
	python-docutils
	python-h5py
	python-matplotlib
	python-mpltoolkits.basemap
	python-pyparsing 
	python-pip
	python-psutil
	python-pyproj
	python-rope
	python-scientific
	python-scitools
	python-scipy
	python-setuptools 
	python-sphinx
	python-sympy
	python-tornado
	"
sudo apt-get remove $LIST_OF_APPS

#Installing the Scipy Stack
# First install dev/dep files
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get update -qq
apt-get install -y -qq python-pip


	LIST_OF_APPS="
	build-essential
	cython
	gdal-bin
	gfortran
	git
	git-core
	libatlas-base-dev
	libatlas-dev
	libblas-dev
	libfreetype6-dev
	liblapack-dev
	libgdal-dev
	libgdal1-dev
	libgeos-dev
	libgeos-3.4.2
	libgrib-api-dev
	libgrib-api-tools
	libgrib2c-dev
	libhdf5-serial-dev
	libjasper-dev
	libnetcdf-dev
	libpng12-dev
	libproj-dev
	psutils
	python-all-dev
	python-dev
	python-gdal
	python-psutil
	python-sip-dev
	python-qt4
	subversion
	"

#~ python-mpltoolkits.basemap

apt-get install -y -q --reinstall $LIST_OF_APPS

# After this script run SOLabServerInstall_2.sh
