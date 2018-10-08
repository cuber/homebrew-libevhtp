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
-	set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include)
+	set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include/evhtp)
 endif()
 
 install (TARGETS evhtp DESTINATION ${LIB_INSTALL_DIR})
diff --git a/evhtp.h b/evhtp.h
index ddc4996..2dc6141 100644
--- a/evhtp.h
+++ b/evhtp.h
@@ -1,7 +1,7 @@
 #ifndef __EVHTP__H__
 #define __EVHTP__H__
 
-#include <evhtp-config.h>
+#include "evhtp-config.h"
 
 #ifndef EVHTP_EXPORT
 # if (defined __GNUC__ && __GNUC__ >= 4) || defined __INTEL_COMPILER || defined __clang__
@@ -12,13 +12,13 @@
 #endif
 
 #ifndef EVHTP_DISABLE_EVTHR
-#include <evthr.h>
+#include "evthr.h"
 #endif
 
-#include <htparse.h>
+#include "htparse.h"
 
 #ifndef EVHTP_DISABLE_REGEX
-#include <onigposix.h>
+#include "onigposix.h"
 #endif
 
 #include <sys/queue.h>

