BUILD_DIR=build
# NB: numpy has to be build along with pandas for proper linkage between libraries
pip-3.6 install --target $BUILD_DIR --no-binary :all: pandas
cd $BUILD_DIR
# Compress binaries
du -sh pandas
find pandas -name "*.so"|xargs strip
du -sh pandas
# Create archive
tar -czvf ../python3.6-pandas-0.23.4.tar.gz pandas
# Check version
python3 -c "import pandas;print(pandas.__version__)"
# Remove artifacts
cd ..
rm -r $BUILD_DIR
