require 'formula'
 
class Libevhtp < Formula
  homepage 'http://github.com/ellzey/libevhtp'
  url 'https://github.com/ellzey/libevhtp/archive/1.2.10.tar.gz'
  version '1.2.10'
  sha1 'c481be3b26a4379e39d5952ff60a195f2c0e2176'
 
  head 'git://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'openssl'
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end
