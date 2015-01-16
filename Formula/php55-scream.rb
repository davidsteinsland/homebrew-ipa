require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Scream < AbstractPhp55Extension
  init
  homepage 'http://pecl.php.net/package/scream'
  url 'http://pecl.php.net/get/scream-0.1.0.tgz'
  sha1 '603048320d6e0b714b85ee84c5bb7a874de1eb26'
  head 'https://svn.php.net/repository/pecl/scream/trunk/'

  def php_branch
    "5.5"
  end

  def extension
    "scream"
  end

  def install
    Dir.chdir "scream-0.1.0"

    ENV.universal_binary if build.universal?

    safe_phpize

    args = []
    args << "--prefix=#{prefix}"
    args << phpconfig

    system "./configure", *args

    system "make"
    prefix.install "modules/scream.so"
    write_config_file if build.with? "config-file"
  end
end
