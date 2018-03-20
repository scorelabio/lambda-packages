BUILD_DIR=build
# NB: numpy has to be build along with pandas for proper linkage between libraries
pip-3.6 install --target $BUILD_DIR --no-binary numpy numpy
cd $BUILD_DIR
# Compress binaries
du -sh numpy
find numpy -name "*.so"|xargs strip
du -sh numpy
# Create archive
tar -czvf ../python3.6-numpy-1.14.2.tar.gz numpy
# Check version
python3 -c "import numpy;print(numpy.__version__)"
# Remove artifacts
cd ..
rm -r $BUILD_DIR
