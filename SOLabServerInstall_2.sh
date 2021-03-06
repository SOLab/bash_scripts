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
#~ pip install --upgrade matplotlib
pip install --upgrade pandas
pip install --upgrade sympy
pip install --upgrade nose                # used by the test suite of nbconvert
pip install --upgrade shapely pyshp pep8
pip install --upgrade Pydap

pip install --upgrade netCDF4             # Python/numpy interface to netCDF
#~ pip install --upgrade http://netcdf4-python.googlecode.com/files/netCDF4-1.0.7.tar.gz

cd ~/; [ -d matplotlib ] && rm -rf matplotlib;
pip uninstall matplotlib
git clone --recursive git://github.com/matplotlib/matplotlib.git && cd matplotlib
#~ Change hard coded limits of (32768, 32768) pixels for a large image 
sed -i 's/if (rows >= 32768 || cols >= 32768) {/if (rows >= 128000 || cols >= 128000) {/' src/_image.h
sed -i 's/throw "rows and cols must both be less than 32768";/throw "rows and cols must both be less than 128000";/'  src/_image.h
python setup.py build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf
cd ~/; #rm -rf matplotlib

cd ~/; [ -d basemap ] && rm -rf basemap;
git clone --recursive git://github.com/matplotlib/basemap.git && cd basemap
export GEOS_DIR=/usr
python setup.py build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf
cd ~/; #rm -rf basemap

#~ wget http://sourceforge.net/projects/matplotlib/files/matplotlib-toolkits/basemap-1.0.7/basemap-1.0.7.tar.gz
#~ ln -s /usr/lib/libgeos-3.4.2.so /usr/lib/libgeos.so
#~ pip install basemap-1.0.7.tar.gz

pip install --upgrade --force-reinstall jupyter

#~ pip install --upgrade "ipython[notebook]"

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


cd ~/; [ -d pycoast ] && rm -rf pycoast;
git clone https://github.com/pytroll/pycoast.git
cd pycoast
# change _iterate_db in cw_base
# replace # for i in range(level): to add lakes support
# if type(level) == int:
#     level = range(level-1,level)
# for i in level:
sed -i 's/for i in range(level):/if type(level) == int:\n            level = range(level-1,level)\n        for i in level:/' pycoast/cw_base.py
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf


#~ install "ENVISAT Product Reader API for C"
pip uninstall pyepr

cd ~/; [ -d epr-api ] && rm -rf epr-api;
git clone https://github.com/bcdev/epr-api
cd epr-api; mkdir -p build/release
make all_rel
rm /usr/local/lib/libepr_api.so 
cp build/release/libepr_api.so /usr/local/lib/
ldconfig
cd ~/; [ -d pyepr ] && rm -rf pyepr;
git clone https://github.com/avalentino/pyepr
cd pyepr
python setup.py --epr-api-src=~/epr-api/src/ build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ Manage XML2dict
pip install --upgrade https://github.com/martinblech/xmltodict/archive/master.zip

#~ Install pyGRIB for ncep support
pip install --upgrade pygrib

#~  Install pykdtree for Pyresample
cd ~/; [ -d pykdtree ] && rm -rf pykdtree;
git clone https://github.com/storpipfugl/pykdtree.git
cd pykdtree
python setup.py build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ Install numexpr for Pyresample
pip install --upgrade  --force-reinstall numexpr
python -c "import numexpr; numexpr.test()"

#~ Installing Theano
apt-get install libopenblas-dev
pip install --upgrade Theano
if grep -Fxq "export OMP_NUM_THREADS" ~/.bashrc
	then
		echo "OMP_NUM_THREADS already set in bash_profile"
	else
		echo "export OMP_NUM_THREADS=16" >> ~/.bashrc
fi
THEANO_FLAGS=floatX=float32,device=gpu python /usr/local/lib/python2.7/dist-packages/theano/misc/check_blas.py

#~ Installing Pyresample
#~ pip install --upgrade pyresample
cd ~/Documents/repos/solab/pyresample/
python setup.py build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ Install redis for PosadaApi
pip install --upgrade redis

#~ Install Plotly for interactive plotting
pip install --upgrade plotly

#~ Install Bokeh for interactive plotting
#~ pip install --upgrade bokeh

#~ Bringing Matplotlib to the Browser
pip install --upgrade mpld3

# smart progress meter
sudo -H pip install -U tqdm

# Pandas and statsmodels
sudo -H pip install --upgrade statsmodels

# Installing scikit-learn
sudo -H pip install --upgrade scikit-learn




#~ For cerbere
#~ If the installation fails, check that the directory you specified in LIBRARY_DIRS contains libmfhdf.so and libdf.so.
#~ They may have been renamed, preventing the linker to find them. 
#~ For example, on Ubuntu 12.04, you can find these libraries as "libmfhdfalt.so" and "libdfalt.so".
#~ To fix this, edit setup.py and set the correct names in the "libraries" variable (line 88). 
#~ cd  ~/Documents/repos/solab/cerbere/
#~ wget http://hdfeos.org/software/pyhdf/pyhdf-0.9.0.tar.gz
#~ tar xvzf pyhdf-0.9.0.tar.gz; cd pyhdf-0.9.0/
#~ export INCLUDE_DIRS=/usr/include/hdf; export LIBRARY_DIRS=/usr/lib; sudo -H pip install .
#~ cd ~/Documents/repos/solab/cerbere/
#~ sudo -H pip install .
#~ cd ~/Documents/repos/solab/sar/
#~ sudo -H pip install .

#~ cd ~/Documents/repos/solab/PySOL/pySAR/
#~ git remote add -t develop sar https://git.oceandatalab.com/gilles.guitton/sar.git
#~ git fetch -v sar
