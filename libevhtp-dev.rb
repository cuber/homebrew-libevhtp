require 'formula'
 
class LibevhtpDev < Formula
  homepage 'http://github.com/cuber/libevhtp'
  url 'https://github.com/cuber/libevhtp/archive/develop.zip'
  version 'a9705c8'
  sha256 '8f573e4f3a01826d33f9a63edddf6f4c7fb7e79fab9307836758f493d1f36530'
 
  head 'git://github.com/cuber/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  patch :DATA
end

__END__
diff --git a/CMakeLists.txt b/CMakeLists.txt
index 93d3b44..d47ed46 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -316,23 +316,23 @@ if(NOT INCLUDE_INSTALL_DIR)
 endif()
 
 install (TARGETS evhtp DESTINATION ${LIB_INSTALL_DIR})
-install (FILES evhtp.h DESTINATION ${INCLUDE_INSTALL_DIR}/evhtp)
-install (FILES htparse.h DESTINATION ${INCLUDE_INSTALL_DIR}/evhtp)
-install (FILES ${CMAKE_CURRENT_BINARY_DIR}/evhtp-config.h DESTINATION ${INCLUDE_INSTALL_DIR}/evhtp)
+install (FILES evhtp.h DESTINATION ${INCLUDE_INSTALL_DIR})
+install (FILES htparse.h DESTINATION ${INCLUDE_INSTALL_DIR})
+install (FILES ${CMAKE_CURRENT_BINARY_DIR}/evhtp-config.h DESTINATION ${INCLUDE_INSTALL_DIR})
 
 if (NOT EVHTP_DISABLE_EVTHR)
-	install (FILES evthr.h DESTINATION ${INCLUDE_INSTALL_DIR}/evhtp)
+	install (FILES evthr.h DESTINATION ${INCLUDE_INSTALL_DIR})
 endif()
 
 if (NOT EVHTP_DISABLE_REGEX)
 		if (NOT HAS_SYS_ONIG)
-				install (FILES oniguruma/onigposix.h DESTINATION ${INCLUDE_INSTALL_DIR}/evhtp)
+				install (FILES oniguruma/onigposix.h DESTINATION ${INCLUDE_INSTALL_DIR})
 		endif()
 endif()
 
 if (NOT HAVE_SYS_QUEUE)
 		install(FILES ${CMAKE_CURRENT_BINARY_DIR}/compat/sys/queue.h
-				DESTINATION ${INCLUDE_INSTALL_DIR}/evhtp/sys)
+				DESTINATION ${INCLUDE_INSTALL_DIR}/sys)
 endif()
 
 IF (WIN32)
diff --git a/evhtp.c b/evhtp.c
index 6ff6b90..4fde2fe 100644
--- a/evhtp.c
+++ b/evhtp.c
@@ -1861,10 +1861,11 @@ _evhtp_connection_writecb(evbev_t * bev, void * arg) {
         bufferevent_enable(bev, EV_READ);
 
         if (evbuffer_get_length(bufferevent_get_input(bev))) {
+            return
             _evhtp_connection_readcb(bev, arg);
         }
 
-        return;
+        // return;
     }
 
     if (c->request->finished == 0 || evbuffer_get_length(bufferevent_get_output(bev))) {

