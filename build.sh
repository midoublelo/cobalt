if [ "$1" == "release" ] 
then
    echo "Building Cobalt in release mode..."
    crystal build src/cobalt.cr --release
else
    echo "Building Cobalt in dev mode..."
    crystal build src/cobalt.cr
fi