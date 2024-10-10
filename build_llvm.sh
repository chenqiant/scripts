git clone -b esp-17.0.1_20240419 https://github.com/espressif/esp-llvm-embedded-toolchain.git
export GL_SERVER=github.com
mkdir build
cd build
cmake ../esp-llvm-embedded-toolchain -GNinja \
        -DFETCHCONTENT_SOURCE_DIR_LLVMPROJECT=~/Workspace/llvm-project \
        -DNEWLIB_REPO_URL="https://$GL_SERVER/espressif/newlib-esp32.git" \
        -DBINUTILS_REPO_URL="https://$GL_SERVER/espressif/binutils-gdb.git" \
        -DXTENSA_OVERLAYS_REPO_URL="https://$GL_SERVER/espressif/xtensa-overlays.git" \
        -DFETCHCONTENT_QUIET=OFF \
        -DESP_GNU_TOOLCHAIN_VER="13.2.0_20240305" \
        -DCPACK_ARCHIVE_THREADS=0 \
        -DUSE_LIBC=newlib \
        -DUSE_LIBCXX="libstdcxx" \
        -DUSE_RTLIB="compiler-rt;libgcc" \
        -DUSE_BINUTILS=ON \
        -DESP_TOOLCHAIN=ON \
        -DHOST_TRIPLE=x86_64-linux-gnu \
        -DLLVM_TOOLCHAIN_ENABLED_TARGETS="RISCV" \
        -DLLVM_ENABLE_PROJECTS='clang;lld;clang-tools-extra' \
        -DCMAKE_BUILD_TYPE=Debug \
        -DLLVM_ENABLE_ASSERTIONS=OFF \
        -DLLVM_USE_LINKER=mold \
        -DCMAKE_C_FLAGS="-O0 -fuse-ld=mold" \
        -DCMAKE_CXX_FLAGS="-O0 -fuse-ld=mold" \
        -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" \
        -B ~/Workspace/tool/build_esp_clang \
        --install-prefix=~/Workspace/tool/esp-clang_Release

ninja -C ~/Workspace/tool/build_esp_clang clang opt -j18

# install toolchain to ~/Workspace/tool/esp-clang_Release 
ninja -C ~/Workspace/tool/build_esp_clang install-llvm-toolchain -j18

# or package toolchain. Archive should be in ~/Workspace/tool/build_esp_clang
ninja -C ~/Workspace/tool/build_esp_clang package-llvm-toolchain -j18