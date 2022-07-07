echo "Compiling GioEngine..."
mkdir tmp
cd tmp
cmake ../..
cmake --build .
shopt -s extglob
rm -r -- !(GioEngine)
echo "Running GioEngine..."
./GioEngine
cd ../
rm -r tmp
