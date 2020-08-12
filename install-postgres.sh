#!/bin/bash
sudo apt install postgresql postgresql-contrib
sudo su - postgres;
psql -c "alter user postgres with password 'postgres'";
createdb cl-local -O postgres;
logout;

sudo add-apt-repository ppa:timescale/timescaledb-ppa
sudo apt-get update
sudo apt install timescaledb-postgresql-12;
timecaledb-tune --quiet --yes;
sudo apt install postgis;
sudo service postgresql restart;

