sudo apt-get install nodejs-legacy npm python-virtualenv python-dev

#~ http://stackoverflow.com/questions/29099404/ssl-insecureplatform-error-when-using-requests-package
sudo pip install --upgrade --force-reinstall  requests[security]

cd ~/; [ -d Jupyter ] && rm -rf Jupyter; mkdir Jupyter; cd Jupyter

sudo pip install virtualenvwrapper

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

cd ~/Jupyter

git clone https://github.com/jupyter/notebook.git
cd notebook

#~ Remove NBCONVERT from requirements before install (SSL error)

pip install -r requirements.txt -e .
python setup.py build
python setup.py install --record files.txt # cat files.txt | xargs sudo rm -rf

#~  ./initiateXUbuntu.sh; cd ~/Documents/repos/solab/PySOL/notebooks/; screen jupyter notebook --config=/home/mag/.ipython/profile_nbserver/ipython_notebook_config.py

