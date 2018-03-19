mkdir -p build && cd build
# NB: numpy has to be build along with pandas for proper linkage between libraries
pip install --target . --no-binary pandas pandas
# Compress binaries
du -sh pandas
find pandas -name "*.so"|xargs strip
du -sh pandas
# Create archive
tar -czvf ../python3.6-pandas-0.22.0.tar.gz pandas
# Check version
python3 -c "import pandas;print(pandas.__version__)"
# Remove artifacts
cd ..
rm -r build
