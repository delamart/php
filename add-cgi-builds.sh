#!/bin/bash

for d in */*/; do
    echo "updating ${d}cgi"
    rm -rf "${d}cgi"
    cp -r "${d}cli" "${d}cgi"
    # remove the disable-cgi flag
    sed -i '' '/--disable-cgi/s/^/#/g' "${d}cgi/Dockerfile"
    # change keyserver for GPG
    sed -i '' 's/ha.pool.sks-keyservers.net/pgp.mit.edu/g' "${d}cgi/Dockerfile"
done
