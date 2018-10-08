require 'formula'

class Libevhtp < Formula
  homepage 'http://github.com/cuber/libevhtp'
  url 'https://github.com/cuber/libevhtp/archive/1.2.10.tar.gz'
  version '1.2.10'
  sha256 '1cecc250a766cd6f5df35706181427cfcff62541a7a135a821eed9f61c9c8907'

  head 'git://github.com/cuber/libevhtp.git'

  depends_on 'cmake' => :build
  depends_on 'openssl'
  depends_on 'libevent'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  patch :DATA
end

__END__
diff --git a/CMakeLists.txt b/CMakeLists.txt
index ee79fa8..fe817e6 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -293,7 +293,7 @@ if (NOT LIB_INSTALL_DIR)
 endif (NOT LIB_INSTALL_DIR)

 if(NOT INCLUDE_INSTALL_DIR)
-       set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include)
+       set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include/evhtp)
 endif()

 install (TARGETS evhtp DESTINATION ${LIB_INSTALL_DIR})
