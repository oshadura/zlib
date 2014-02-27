if [ $HEP_COMPILER = "icc" ]; then
  CC="icc -fPIC"
fi

case $HEP_ARCH in
   *_amd64_gcc4[56789]* )
     CFLAGS="-fPIC -O3 -DUSE_MMAP -DUNALIGNED_OK -D_LARGEFILE64_SOURCE=1 -msse3" \
     ./configure --prefix=$HEP_BUILDROOT
     ;;
   *_armv7hl_gcc4[56789]* )
     CFLAGS="-fPIC -O3 -DUSE_MMAP -DUNALIGNED_OK -D_LARGEFILE64_SOURCE=1" \
     ./configure --prefix=$HEP_BUILDROOT
     ;;
   * )
     CC=$CC ./configure --prefix=$HEP_BUILDROOT
     ;;
esac

make $HEP_MAKEPROCESSES
