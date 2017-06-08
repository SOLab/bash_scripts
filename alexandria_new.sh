python /var/www/new/alexandria/alexandria/main.py -p solab_sentinel_1a -d /nfs1/store/nctiles/SOLAB_SENTINEL_1A/nice_image/epsg_3413_/
python /var/www/new/alexandria/alexandria/main.py -p solab_sentinel_1a -d /nfs1/store/nctiles/SOLAB_SENTINEL_1A/wind_speed/epsg_3413_/
python /var/www/new/alexandria/alexandria/main.py -p solab_sentinel_1a -d /nfs1/store/nctiles/SOLAB_SENTINEL_1A/sigma0/epsg_3413_/

python /var/www/new/alexandria/alexandria/main.py -p solab_sentinel_1b -d /nfs1/store/nctiles/SOLAB_SENTINEL_1B/nice_image/epsg_3413_/
python /var/www/new/alexandria/alexandria/main.py -p solab_sentinel_1b -d /nfs1/store/nctiles/SOLAB_SENTINEL_1B/wind_speed/epsg_3413_/
python /var/www/new/alexandria/alexandria/main.py -p solab_sentinel_1b -d /nfs1/store/nctiles/SOLAB_SENTINEL_1B/sigma0/epsg_3413_/

python /var/www/new/alexandria/alexandria/main.py -p solab_asar -d /nfs1/store/nctiles/SOLAB_ASAR/wind_speed/epsg_3413_/
python /var/www/new/alexandria/alexandria/main.py -p solab_asar -d /nfs1/store/nctiles/SOLAB_ASAR/sigma0/epsg_3413_/

curl -L http://satinapi.dev.solab.rshu.ru/clear_cache