require 'formula'
 
class LibevhtpDev < Formula
  homepage 'http://github.com/ellzey/libevhtp'
  url 'https://github.com/ellzey/libevhtp/archive/develop.zip'
  version 'develope'
  sha1 '02a72707354e64143b20669e073c7cfbeb3672b8'
 
  head 'git://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  patch :DATA
end

__END__
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

