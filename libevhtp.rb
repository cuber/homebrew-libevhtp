require 'formula'
 
class Libevhtp < Formula
  homepage 'http://github.com/criticalstack/libevhtp'
  url 'https://github.com/criticalstack/libevhtp/archive/1.2.11n.tar.gz'
  version '1.2.11n'
  sha256 'dd914c7f09eb84738fb45bbcf24ce17f6b0d008e28ff2d773b2bf7e761b10295'
 
  head 'git://github.com/criticalstack/libevhtp.git'
 
  depends_on 'cmake' => :build
  depends_on 'openssl'
  depends_on 'libevent'
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end
end
