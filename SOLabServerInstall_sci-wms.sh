#Installing the Sci-WMS Deps

	LIST_OF_APPS="
	libevent-dev
	libspatialindex-dev
	libcurl4-gnutls-dev
	"

apt-get install -y -q --reinstall $LIST_OF_APPS

sudo pip install --upgrade numpy gunicorn gevent matplotlib netCDF4==1.0.4 shapely rtree django==1.4
