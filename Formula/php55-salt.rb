require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Salt < AbstractPhp55Extension
  init
  homepage 'https://github.com/SaltShipDesign/salt-util'
  url 'https://github.com/SaltShipDesign/salt-util/archive/v0.4.8.tar.gz'
  sha1 '4f1629309ccba6c26fa09761a8a710c10575b1cf'
  head 'https://github.com/SaltShipDesign/salt-util.git'

  def install
    Dir.chdir "ext"

    ENV.universal_binary if build.universal?

    safe_phpize

    args = []
    args << "--prefix=#{prefix}"
    args << phpconfig

    system "./configure", *args

    system "make"
    prefix.install "modules/salt.so"
    write_config_file if build.with? "config-file"
  end
end
