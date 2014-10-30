apt-get install -y -q ipython-notebook
apt-get install -y -q libpng-dev libjpeg8-dev libfreetype6-dev git-core 
/usr/local/bin/pip install --upgrade pyzmq		# needed for IPython’s parallel computing features, qt console and notebook.
/usr/local/bin/pip install --upgrade tornado	# needed by the web-based notebook
/usr/local/bin/pip install --upgrade numpy
/usr/local/bin/pip install --upgrade matplotlib
#/usr/local/bin/pip install --upgrade ipython
#/usr/local/bin/pip install --upgrade https://github.com/ipython/ipython/tarball/master
#/usr/local/bin/pip install --upgrade -e git://github.com/ipython/ipython.git#egg=ipython
/usr/local/bin/pip uninstall ipython
git clone --recursive git://github.com/ipython/ipython.git && cd ipython && python setup.py submodule && python setup.py install


#~ Install nbconvert from https://github.com/ipython/nbconvert
apt-get install -y -q texlive-full pandoc python-jinja2
/usr/local/bin/pip install --upgrade markdown
curl http://docutils.svn.sourceforge.net/viewvc/docutils/trunk/docutils/?view=tar > docutils.tgz
/usr/local/bin/pip install --upgrade docutils.tgz; rm docutils.tgz
/usr/local/bin/pip install --upgrade pygments	# used by the Qt console for syntax highlighting.
/usr/local/bin/pip install --upgrade nose		# used by the test suite
rm -rf /opt/nbconvert/; git clone git://github.com/ipython/nbconvert.git; mv -f nbconvert/ /opt/
ln -s /opt/nbconvert/nbconvert2.py /usr/local/bin/nbconvert

#~ %hierarchy and %%dot magics for IPython from https://github.com/tkf/ipython-hierarchymagic
#~  inside ipython run
#~ %install_ext https://raw.github.com/tkf/ipython-hierarchymagic/master/hierarchymagic.py
apt-get install -y -q graphviz
ipython -c "%install_ext https://raw.github.com/tkf/ipython-hierarchymagic/master/hierarchymagic.py"
