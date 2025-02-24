set -eo pipefail

tag="$1"

if [ -z "$tag" ]; then
  echo "Usage: $0 <tag>"
  exit 1
fi

echo "Building valgrind@$tag"

git clone https://sourceware.org/git/valgrind.git --branch "$tag" --depth 1 --single-branch valgrind-src

cd valgrind-src

./autogen.sh
./configure --prefix=$(pwd)/../dist
make -j$(nproc)
make install
