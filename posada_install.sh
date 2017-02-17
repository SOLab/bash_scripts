mkdir -p /var/log/posada/
touch /var/log/posada/posada.out && chmod 777 /var/log/posada/posada.out


apt-get install git \
				python3-pip \
        		libblas-dev \
                liblapack-dev \
               	gfortran \
                python3-gdal \
                libgrib-api-dev \
                libhdf5-dev \
                libnetcdf-dev -y

pip3 install --upgrade pip
pip3 install numpy scipy pyresample shapely
pip3 install --upgrade netcdf4
pip3 install pygrib==2.0.1
pip3 install --upgrade https://github.com/CooledCoffee/loggingd/archive/master.zip
#pip install python-dateutil