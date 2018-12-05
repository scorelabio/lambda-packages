sudo yum update -y
sudo yum install -y \
	atlas-devel \
	atlas-sse3-devel \
	blas-devel \
	gcc \
	gcc-c++ \
	lapack-devel
BUILD_DIR=build
pip-3.6 install --target $BUILD_DIR --no-binary numpy numpy
cd $BUILD_DIR
# Copy BLAS/LAPACK binaries
mkdir -p lib
cp /usr/lib64/atlas/* lib
cp /usr/lib64/libquadmath.so.0 lib
cp /usr/lib64/libgfortran.so.3 lib
# Compress binaries
du -sh *
find . -name "*.so"|xargs strip
du -sh *
# Create archive
tar -czf ../python3.6-numpy-1.15.4.tar.gz numpy
# Check version
python3 -c "import numpy;print(numpy.__version__)"
# Remove artifacts
cd ..
rm -r $BUILD_DIR
