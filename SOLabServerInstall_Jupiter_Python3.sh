sudo apt-get install python-dev python3-dev python-pip python3-pip
sudo -H pip3 install -U jupyter ipython3
sudo -H pip3 install -U jupyter ipython
sudo pip3 install ipykernel
python3 -m ipykernel.kernelspec --user
# sudo jupyter kernelspec list

# To enable a Python 3 kernel when you're running the server on Python 2, it should be sufficient to do:
# pip3 install ipykernel
# python3 -m ipykernel.kernelspec --user

# And if you run the server on Python 3 and want to add a Python2 kernel, do exactly the same on Python 2:
# pip2 install ipykernel
# python2 -m ipykernel.kernelspec --user

sudo apt-get install nodejs-legacy npm python-virtualenv python3-dev

sudo -H pip3 install --upgrade --force-reinstall setuptools pip

#~ http://stackoverflow.com/questions/29099404/ssl-insecureplatform-error-when-using-requests-package
sudo -H pip3 install --upgrade --force-reinstall requests[security]

# cd ~/; [ -d Jupyter ] && rm -rf Jupyter; mkdir Jupyter; cd Jupyter

# sudo -H pip3 install virtualenvwrapper

# if grep -Fxq "# virtualenv" ~/.bashrc
# 	then
# 		echo "virtualenv already set in bash_profile"
# 	else
# 		echo "# virtualenv
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# # virtualenv aliases
# # http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
# alias v='workon'
# alias v.deactivate='deactivate'
# alias v.mk='mkvirtualenv --no-site-packages'
# alias v.mk_withsitepackages='mkvirtualenv'
# alias v.rm='rmvirtualenv'
# alias v.switch='workon'
# alias v.add2virtualenv='add2virtualenv'
# alias v.cdsitepackages='cdsitepackages'
# alias v.cd='cdvirtualenv'
# alias v.lssitepackages='lssitepackages'" >> ~/.bashrc
# fi

# #~ Put these lines to function promptcmd () {
# #~ vim ~/.bashrc_megafancy.sh
#   # Get Virtual Env
#   if [[ $VIRTUAL_ENV != "" ]]
#     then
#      # Strip out the path and just leave the env name
#      venv="\[${COLOR_RED}\]{ ${VIRTUAL_ENV##*/} } \[${COLOR_DEFAULT}\]"
#   else
#      # In case you don't have one activated
#      venv=''
#   fi
#   PS1="${PS1}${venv}"


# mkdir -p $WORKON_HOME
# source ~/.bashrc

# mkvirtualenv --no-site-packages notebook
# pip3 install --upgrade --force-reinstall setuptools pip3 

# #~ http://stackoverflow.com/questions/29099404/ssl-insecureplatform-error-when-using-requests-package
# pip3 install --upgrade --force-reinstall requests[security]

# #~ git clone https://github.com/jupyter/nbconvert.git
# #~ cd nbconvert
# #~ pip3 install -r requirements.txt -e .
# #~ python setup.py build
# #~ python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

# #~ cd ~/Jupyter
# #~ git clone https://github.com/jupyter/notebook.git
# #~ cd notebook

# #~ Remove NBCONVERT from requirements before install (SSL error)
# #~ 
# #~ pip3 install -r requirements.txt -e .
# #~ python setup.py build
# #~ python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ apt-get install --no-install-recommends texlive-latex-extra texlive-fonts-recommended
sudo apt-get install -y -qq texlive-full pandoc

pip3 install --upgrade --force-reinstall pyzmq tornado jsonschema jsonpointer pandas sympy nose shapely pyshp pep8 ipython jupyter
pip3 install --upgrade matplotlib h5py Jinja2 markupsafe pillow pyflakes pyproj rope sphinx pyepr
pip3 install --upgrade markdown docutils pygments
pip3 install --upgrade numpy scipy

sudo apt-get install libhdf5-dev libnetcdf-dev netcdf-bin
pip3 install --upgrade netcdf4

#~ Manage XML2dict
pip3 install --upgrade https://github.com/martinblech/xmltodict/archive/master.zip

#~ Install pyGRIB for ncep support
sudo apt-get install libopenjpeg-dev
pip3 install --upgrade pygrib

# Glymur: a Python interface for JPEG 2000 - for Sentinel-2
sudo apt-get install libxml2-dev libxslt-dev python-dev # needed by lxlml
pip3 install --upgrade glymur
 # classical Bayesian for Sentinel-2: cB4S2
pip3 install --upgrade dill stopit

#~ Install pykdtree for Pyresample
cd ~/; [ -d pykdtree ] && rm -rf pykdtree;
git clone https://github.com/storpipfugl/pykdtree.git
cd ~/pykdtree
python3 setup.py build
python3 setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ Install numexpr for Pyresample
pip3 install --upgrade --force-reinstall numexpr
python3 -c "import numexpr; numexpr.test()"

#~ Installing Pyresample
#~ pip install --upgrade pyresample
cd ~/; [ -d pyresample ] && rm -rf pyresample;
git clone https://github.com/pytroll/pyresample.git
cd ~/pyresample
python3 setup.py build
python3 setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

cd ~/; [ -d basemap ] && rm -rf basemap;
git clone --recursive git://github.com/matplotlib/basemap.git && cd basemap
export GEOS_DIR=/usr
python3 setup.py build
python3 setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf
cd ~/; #rm -rf basemap


#~ Installing NB Extensions
pip3 install --upgrade psutil pyyaml
cd ~
git clone https://github.com/ipython-contrib/IPython-notebook-extensions.git
cd IPython-notebook-extensions/
python3 setup.py install
jupyter nbextension enable equation-numbering

#~ Installing RISE
cd ~
git clone https://github.com/damianavila/RISE.git
cd RISE
python3 setup.py install
jupyter nbextension enable livereveal

jupyter nbextension enable --py --sys-prefix widgetsnbextension


#~ jupyter nbextension install https://github.com/ipython-contrib/IPython-notebook-extensions/tree/master/nbextensions/usability/equation-numbering



#~ ./initiateXUbuntu.sh; cd ~/Documents/repos/solab/PySOL/notebooks/; screen jupyter notebook --config=/home/mag/.ipython/profile_nbserver/ipython_notebook_config.py


