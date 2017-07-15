require 'formula'
 
class Libevhtp < Formula
  homepage 'http://github.com/criticalstack/libevhtp'
  url 'https://github.com/criticalstack/libevhtp/archive/1.2.11n.tar.gz'
  version '1.2.11n'
  sha256 'ae114300659267c7e5f9805ba15f7e3f3461613371f38e3f84520a1703146afd'
 
  head 'git://github.com/criticalstack/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'openssl'
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end
