#!/bin/bash

rm out.txt
rm outTot.txt
#01
./sesc.mem -ccombina.conf  km_overhead
mv out.txt km_overhead_inorder.txt
echo " km_overhead done"

./sesc.mem -ccombina.conf  km_overhead_overhead
mv out.txt km_overhead_overhead_inorder.txt
echo " km_overhead_overhead done"
