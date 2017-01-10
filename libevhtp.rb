require 'formula'
 
class Libevhtp < Formula
  homepage 'http://github.com/ellzey/libevhtp'
  url 'https://github.com/ellzey/libevhtp/archive/1.2.10.tar.gz'
  version '1.2.10'
  sha256 '1cecc250a766cd6f5df35706181427cfcff62541a7a135a821eed9f61c9c8907'
 
  head 'git://github.com/ellzey/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'openssl'
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end
