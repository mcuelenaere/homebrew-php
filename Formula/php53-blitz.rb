require 'formula'
require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Blitz < AbstractPhp53Extension
  init
  homepage 'http://alexeyrybak.com/blitz/blitz_en.html'
  url 'http://alexeyrybak.com/blitz/blitz-0.8.6.tar.gz'
  sha1 '688ceb3579d9da6cd0b84122445ebe7c847c4525'

  def install
    args = []
    args << "--prefix=#{prefix}"
    args << phpconfig

    safe_phpize

    system "./configure", *args
    system "make"
    prefix.install "modules/blitz.so"
    write_config_file unless build.include? "without-config-file"
  end
end
