blockMesh

sed -i "s/normalVector.*;/normalVector (0 0 1);/g" system/mirrorMeshDict
mirrorMesh -overwrite
sed -i "s/normalVector.*;/normalVector (0 1 0);/g" system/mirrorMeshDict
mirrorMesh -overwrite
sed -i "s/normalVector.*;/normalVector (1 0 0);/g" system/mirrorMeshDict
mirrorMesh -overwrite


setExprFields

#add disturbances, replace U file
postProcess -func addDisturbances
cd ./0
sed -i "s/object.*;/object U;/g" ./URandom
rm U;
mv URandom U;

cd ..

checkMesh
renumberMesh -overwrite