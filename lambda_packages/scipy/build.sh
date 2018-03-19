# Install linux deps
sudo yum update -y
sudo yum install -y \
    atlas-devel \
    atlas-sse3-devel \
    blas-devel \
    gcc \
    gcc-c++ \
    lapack-devel \
    python27-devel \
    python27-virtualenv \
    findutils \
    zip
# Create a virtualenv
python3 -m virtualenv venv
source venv/bin/activate
# Install depdencies into virtualenv
pip install numpy
# Compile scipy
pip install --target . --no-binary :all: --no-deps scipy
# Create a lib directory
mkdir -p lib
cp /usr/lib64/atlas/* lib
cp /usr/lib64/libquadmath.so.0 lib
cp /usr/lib64/libgfortran.so.3 lib
# Compress binaries
find lib scipy -name "*.so"|xargs strip
# Create archive
tar -czvf python3.6-scipy-1.0.0.tar.gz lib scipy
# Remove artifacts
deactivate
rm -r venv lib scipy*
