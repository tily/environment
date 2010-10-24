#!/bin/sh -f

x=$(pwd)
x=${x##*/}
rm $x.xpi

# chrome のアーカイブ（無圧縮）
# archive chrome (non-compressed)
mkdir -p build/chrome
cd chrome
find . ! -name '.*' -exec zip -0 ../build/chrome/$x.jar {} \;
cd ..

cp -rf chrome.manifest components defaults install.rdf license.txt build

# 全体のアーカイブ（圧縮）
# archive whole (compressed)
cd build
find . ! -name . -exec zip -9 ../$x.xpi {} \;
cd ..

rm -rf build
