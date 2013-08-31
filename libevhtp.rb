require 'formula'
 
class Libevhtp < Formula
  homepage 'http://github.com/ellzey/libevhtp'
  url 'https://github.com/ellzey/libevhtp/archive/1.2.6.tar.gz'
  version '1.2.6'
  sha1 '6ebbcf86cfb9ee11d079888fddc1510fd0ba3db7'
 
  head 'git://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'libevent'
 
  def install
    system "cmake", ".", "-DEVHTP_DISABLE_SSL:STRING=ON", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end
