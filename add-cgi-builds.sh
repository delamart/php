#!/bin/bash

for d in */*/; do
    echo "updating ${d}cgi"
    rm -rf "${d}cgi"
    cp -r "${d}cli" "${d}cgi"
    sed -i '' '/--disable-cgi/s/^/#/g' "${d}cgi/Dockerfile"
done
