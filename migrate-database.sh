#!/bin/bash
set -e 

if [ ! -f dbgenerada.pid ]; then
	echo "Creando la BD"
	psql -U sae -h localhost -p 5432 sae -f database/sae_dump.sql
	touch dbgenerada.pid
fi

