#!/bin/bash

DIR=$(dirname $0)
pushd $DIR

DEPVER=4

wget -c https://github.com/iiordanov/remote-desktop-clients/releases/download/dependencies/remote-desktop-clients-libs-${DEPVER}.tar.gz

tar xf remote-desktop-clients-libs-${DEPVER}.tar.gz

rsync -a bVNC/prebuilt/ Opaque/prebuilt/

for d in bVNC Opaque
do
  rsync -a ${d}/prebuilt/ ${d}/java
done

echo "Done downloading and extracting dependencies."

popd
