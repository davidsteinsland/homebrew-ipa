require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Salt < AbstractPhp55Extension
  init
  homepage 'https://github.com/SaltShipDesign/salt-util'
  url 'https://github.com/SaltShipDesign/salt-util/archive/v0.4.2.tar.gz'
  sha1 '7c99bd61387d74d1a2a172ea51f83b91ec7251ad'
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
