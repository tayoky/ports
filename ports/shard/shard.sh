GIT=https://github.com/shardlanguage/shard/
COMMIT=3f72898d42f42b6a7d4bc2767f724748b77239e0

build(){
    make -C scripts CC=$CC
}

install(){
    cp shard $PREFIX/bin
}