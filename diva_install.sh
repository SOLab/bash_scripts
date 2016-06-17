#~ Prepare
sudo apt-get install -y gfortran libhdf5-serial-dev libnetcdf-dev netcdf-bin ncview
sudo -H pip install --upgrade pip
sudo -H pip install --upgrade netCDF4

wget http://modb.oce.ulg.ac.be/mediawiki/upload/DIVA/releases/diva-4.6.2.tar.gz
tar -xvzf diva-4.6.2.tar.gz &&  cd diva-4.6.2/

cd DIVA3D/src/Fortran/
./divacompileall

if grep -Fxq "export PATH=$PATH:/home/mag/Documents/repos/solab/diva-4.6.2/DIVA3D/bin/" ~/.bashrc
	then
		echo "DIVA bins already set in bash_profile"
	else
		echo "export PATH=$PATH:/home/mag/Documents/repos/solab/diva-4.6.2/DIVA3D/bin/
		export PATH=$PATH:/home/mag/Documents/repos/solab/diva-4.6.2/DIVA3D/divastripped/" >> ~/.bashrc
fi

source ~/.bashrc

cd ../../divastripped && divabigtest
ncview ./output/ghertonetcdf/results.nc 
