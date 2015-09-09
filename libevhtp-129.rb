require 'formula'
 
class Libevhtp129 < Formula
  homepage 'http://github.com/ellzey/libevhtp'
  url 'https://github.com/ellzey/libevhtp/archive/1.2.9.tar.gz'
  version '1.2.9'
  sha1 'c4edfcfd1427db26e585ee7bc9bce7df4f10ec3d'
 
  head 'git://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end

