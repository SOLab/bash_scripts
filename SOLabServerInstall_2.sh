#sudo apt-get xfce
#startx
#xfce4-session-logout --logout

#Installing the Scipy Stack
# First install dev/dep files from SOLabServerInstall_1.sh

sudo ln -s /usr/local/bin/pip /usr/bin/

pip install --upgrade pip                 # improved Python package installer
pip install --upgrade virtualenv          # a tool to create isolated Python environments
pip install --upgrade setuptools	      # Easily download, build, install, upgrade, and uninstall Python packages
pip install --upgrade cython		      # [Cython] is a programming language that makes writing C extensions for the Python language as easy as Python itself

pip install --upgrade numpy
pip install --upgrade scipy

pip install --upgrade scikit-image        # a collection of algorithms for image processing
pip install --upgrade ipdb        	      # better introspection with the same interface as the pdb module

#~ Installing ZMQ before pyzmq
apt-get install libtool autoconf automake uuid-dev build-essential
wget http://download.zeromq.org/zeromq-4.0.5.tar.gz
tar zxvf zeromq-4.0.5.tar.gz
cd zeromq-4.0.5/
./configure
make && make install

pip install --upgrade --force-reinstall pyzmq  # needed for IPython’s parallel computing features, qt console and notebook.
pip install --upgrade tornado             # needed by the web-based notebook
pip install --upgrade jsonschema jsonpointer # needed by ipython notebook
pip install --upgrade matplotlib
pip install --upgrade pandas
pip install --upgrade sympy
pip install --upgrade nose                # used by the test suite of nbconvert
pip install --upgrade shapely pyshp pep8
pip install --upgrade Pydap

pip install --upgrade netCDF4             # Python/numpy interface to netCDF
#~ pip install --upgrade http://netcdf4-python.googlecode.com/files/netCDF4-1.0.7.tar.gz

cd ~/; [ -d matplotlib ] && rm -rf matplotlib;
pip uninstall matplotlib
git clone --recursive git://github.com/matplotlib/matplotlib.git && cd matplotlib && python setup.py install
cd ~/; rm -rf matplotlib

cd ~/; [ -d basemap ] && rm -rf ipython;
git clone --recursive git://github.com/matplotlib/basemap.git && cd basemap
export GEOS_DIR=/usr
python setup.py build
python setup.py install
cd ~/; rm -rf basemap

#~ wget http://sourceforge.net/projects/matplotlib/files/matplotlib-toolkits/basemap-1.0.7/basemap-1.0.7.tar.gz
#~ ln -s /usr/lib/libgeos-3.4.2.so /usr/lib/libgeos.so
#~ pip install basemap-1.0.7.tar.gz


pip install --upgrade "ipython[notebook]"
#~ pip uninstall ipython
#~ cd ~/; [ -d ipython ] && rm -rf basemap;
#~ git clone --recursive git://github.com/ipython/ipython.git && cd ipython && python setup.py submodule && python setup.py install
#~ cd ~/; rm -rf ipython

#~ We should fix PIL path libraries by :
sudo ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
sudo ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib
sudo ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib

pip install --upgrade h5py Jinja2 markupsafe pillow pyflakes pyproj rope sphinx

pip install --upgrade wsgiref argparse pyparsing python-dateutil geographiclib
pip install --upgrade http://scitools.googlecode.com/files/scitools-0.9.0.tar.gz

# Some minor things

#~ Install nbconvert from https://github.com/ipython/nbconvert
apt-get install -y -qq texlive-full pandoc
pip install --upgrade markdown
pip install --upgrade docutils
pip install --upgrade pygments	# used by the Qt console for syntax highlighting.
#~ nbconvert
#rm -rf /opt/nbconvert/; git clone git://github.com/ipython/nbconvert.git; mv -f nbconvert/ /opt/
#ln -s /opt/nbconvert/nbconvert2.py nbconvert

#~ %hierarchy and %%dot magics for IPython from https://github.com/tkf/ipython-hierarchymagic
#~  inside ipython run
#~ %install_ext https://raw.github.com/tkf/ipython-hierarchymagic/master/hierarchymagic.py
apt-get install -y -q graphviz
#~ ipython -c "%install_ext https://raw.github.com/tkf/ipython-hierarchymagic/master/hierarchymagic.py"

apt-get autoremove && apt-get autoclean

#~ Install NUMBA

#~ python interface to call out to Matlab(R)
#~ pip install pymatbridge

#~ pip install --upgrade simplekml # a python library for generating kml (or kmz)


#~ install "ENVISAT Product Reader API for C"
pip uninstall pyepr

cd ~/; [ -d epr-api ] && rm -rf epr-api;
git clone https://github.com/bcdev/epr-api
cd epr-api; mkdir -p build/release
make all_rel
ln -s build/release/libepr_api.so /usr/local/lib/
ldconfig
cd ~/; [ -d pyepr ] && rm -rf pyepr;
git clone https://github.com/avalentino/pyepr
cd pyepr
python setup.py --epr-api-src=~/epr-api/src/ build
python setup.py install

#~ Manage XML2dict
pip install --upgrade https://github.com/martinblech/xmltodict/archive/master.zip

