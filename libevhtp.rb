require 'formula'
 
class Libevhtp < Formula
  homepage 'http://github.com/ellzey/libevhtp'
  url 'https://github.com/ellzey/libevhtp/archive/1.2.8.tar.gz'
  version '1.2.8'
  sha1 '6d6064344b45675c250540279abea1dd8a0e3cff'
 
  head 'git://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end
