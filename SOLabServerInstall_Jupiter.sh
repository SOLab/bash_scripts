sudo apt-get install nodejs-legacy npm python-virtualenv python-dev

sudo -H pip install --upgrade --force-reinstall setuptools pip

#~ http://stackoverflow.com/questions/29099404/ssl-insecureplatform-error-when-using-requests-package
sudo -H pip install --upgrade --force-reinstall  requests[security]

cd ~/; [ -d Jupyter ] && rm -rf Jupyter; mkdir Jupyter; cd Jupyter

sudo -H pip install virtualenvwrapper

if grep -Fxq "# virtualenv" ~/.bashrc
	then
		echo "virtualenv already set in bash_profile"
	else
		echo "# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# virtualenv aliases
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'" >> ~/.bashrc
fi

#~ Put these lines to function promptcmd () {
#~ vim ~/.bashrc_megafancy.sh
    # Get Virtual Env
    if [[ $VIRTUAL_ENV != "" ]]
        then
          # Strip out the path and just leave the env name
          venv="\[${COLOR_RED}\]{ ${VIRTUAL_ENV##*/} } \[${COLOR_DEFAULT}\]"
    else
          # In case you don't have one activated
          venv=''
    fi
    PS1="${PS1}${venv}"


mkdir -p $WORKON_HOME
source ~/.bashrc

mkvirtualenv --no-site-packages notebook
pip install --upgrade --force-reinstall setuptools pip

#~ http://stackoverflow.com/questions/29099404/ssl-insecureplatform-error-when-using-requests-package
pip install --upgrade --force-reinstall requests[security]

#~ git clone https://github.com/jupyter/nbconvert.git
#~ cd nbconvert
#~ pip install -r requirements.txt -e .
#~ python setup.py build
#~ python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ cd ~/Jupyter
#~ git clone https://github.com/jupyter/notebook.git
#~ cd notebook

#~ Remove NBCONVERT from requirements before install (SSL error)
#~ 
#~ pip install -r requirements.txt -e .
#~ python setup.py build
#~ python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ apt-get install --no-install-recommends texlive-latex-extra texlive-fonts-recommended
sudo apt-get install -y -qq texlive-full pandoc

pip install --upgrade --force-reinstall pyzmq tornado jsonschema jsonpointer pandas sympy nose shapely pyshp pep8 Pydap netCDF4 ipython jupyter
pip install --upgrade matplotlib h5py Jinja2 markupsafe pillow pyflakes pyproj rope sphinx pyepr
pip install --upgrade markdown docutils pygments
pip install --upgrade numpy scipy

#~ Manage XML2dict
pip install --upgrade https://github.com/martinblech/xmltodict/archive/master.zip

#~ Install pyGRIB for ncep support
sudo apt-get install libopenjpeg-dev
pip install --upgrade pygrib

# Glymur: a Python interface for JPEG 2000 - for Sentinel-2
sudo apt-get install libxml2-dev libxslt-dev python-dev # needed by lxlml
sudo apt-get install libxml2-dev libxslt-dev python-dev
pip install --upgrade glymur
 # classical Bayesian for Sentinel-2: cB4S2
pip install --upgrade dill stopit

#~  Install pykdtree for Pyresample
cd ~/; [ -d pykdtree ] && rm -rf pykdtree;
git clone https://github.com/storpipfugl/pykdtree.git
cd ~/pykdtree
python setup.py build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~ Install numexpr for Pyresample
pip install --upgrade  --force-reinstall numexpr
python -c "import numexpr; numexpr.test()"

#~ Installing NB Extensions
pip install --upgrade psutil pyyaml
cd ~
git clone https://github.com/ipython-contrib/IPython-notebook-extensions.git
cd IPython-notebook-extensions/
python setup.py install
jupyter nbextension enable equation-numbering

#~ Installing RISE
cd ~
git clone https://github.com/damianavila/RISE.git
cd RISE
python setup.py install
jupyter nbextension enable livereveal

jupyter nbextension enable --py --sys-prefix widgetsnbextension


#~ jupyter nbextension install https://github.com/ipython-contrib/IPython-notebook-extensions/tree/master/nbextensions/usability/equation-numbering



#~  ./initiateXUbuntu.sh; cd ~/Documents/repos/solab/PySOL/notebooks/; screen jupyter notebook --config=/home/mag/.ipython/profile_nbserver/ipython_notebook_config.py

