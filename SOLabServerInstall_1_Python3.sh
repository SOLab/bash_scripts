# #~ Uninstall everything
# 	LIST_OF_APPS="
# 	ipython3
# 	pyflakes
# 	python3-docutils
# 	python3-h5py
# 	python3-matplotlib
# 	python3-mpltoolkits.basemap
# 	python3-pyparsing
# 	python3-pip
# 	python3-psutil
# 	python3-pyproj
# 	python3-rope
# 	python3-scipy
# 	python3-setuptools 
# 	python3-sphinx
# 	python3-tornado
# 	"

#~ Uninstall everything
	LIST_OF_APPS="
	ipython3
	pyflakes
	python3-docutils
	python3-h5py
	python3-matplotlib
	python3-pyparsing
	python3-pip
	python3-psutil
	python3-pyproj
	python3-scipy
	python3-setuptools 
	python3-sphinx
	python3-tornado
	"

apt-get remove $LIST_OF_APPS

apt-get -yq autoclean; sudo apt-get -yq autoremove

#Installing the Scipy Stack
# First install dev/dep files
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get update -qq
apt-get install -y -qq python-pip python3-pip


	LIST_OF_APPS="
	build-essential
	cython3
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
	python3-all-dev
	python3-dev
	python3-gdal
	python3-psutil
	python3-sip-dev
	python3-pyqt4
	subversion
	"

#~ python-mpltoolkits.basemap

apt-get install -y -q --reinstall $LIST_OF_APPS

# After this script run SOLabServerInstall_2.sh