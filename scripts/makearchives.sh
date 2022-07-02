

PREFIXPATH=/Data/Documents/CensusProject/gdallib/src/compiled

PKG_CONFIG_PATH=${PREFIXPATH}/lib/pkgconfig
LIBRARY_PATH=${PREFIXPATH}/lib
LD_LIBRARY_PATH=${PREFIXPATH}/lib/
C_INCLUDE_PATH=${PREFIXPATH}/include/
CPLUS_INCLUDE_PATH=${PREFIXPATH}/include/
PATH=${PREFIXPATH}/bin:$PATH
PREFIX=${PREFIXPATH}
# for googles retarded 'bazel' tool thinking tensorflow is bs.
JAVA_HOME=/lib/jvm/java-11-openjdk-11.0.11.0.9-4.fc34.x86_64
PATH=$PATH:$JAVA_HOME/bin

export PREFIXPATH
export JAVA_HOME
export PREFIX
export PKG_CONFIG_PATH
export LIBRARY_PATH
export LD_LIBRARY_PATH
export C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH
export PATH


rm 1.txt 

ext=MOV
    
( ls *.${ext} | xargs -i basename "{}" .${ext} | xargs -i echo ffmpeg -i \"{}.${ext}\" -filter:v \"scale=360:640\"  -movflags use_metadata_tags -y  -c:a copy \"{}-rep.mp4\"  )>>1.txt

sh 1.txt
