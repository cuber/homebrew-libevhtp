require 'formula'

class LibevhtpDev < Formula
  homepage 'http://github.com/cuber/libevhtp'
  url 'https://github.com/cuber/libevhtp/archive/2cfa7a3b80c4f8adea6dde8ba4dd8bdb1fd4d57a.zip'
  version '2cfa7a3'
  sha256 '607e31b0bdbb0d2e0c2e71c4dc3f15fe33cfe49d00d1106d2f3602bf2db293ab'

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
diff --git a/evhtp.h b/evhtp.h
index e0d7a58..07bdc2e 100644
--- a/evhtp.h
+++ b/evhtp.h
@@ -1,17 +1,17 @@
-#include <evhtp-config.h>
+#include "evhtp-config.h"
 
 #ifndef __EVHTP__H__
 #define __EVHTP__H__
 
 /** @file */
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

