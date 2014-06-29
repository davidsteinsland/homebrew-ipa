require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php56Excel < AbstractPhp55Extension
  init
  homepage 'https://github.com/iliaal/php_excel'
  url 'https://github.com/iliaal/php_excel/archive/1.0.tar.gz'
  sha1 '3995b754117952290f0f56a8c2f8653e29a025ea'
  head 'https://github.com/iliaal/php_excel.git'

  depends_on 'libxl'

  def install
    Dir.chdir "php_excel-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize

    args = []
    args << "--prefix=#{prefix}"
    args << phpconfig

    system "./configure", *args

    system "make"
    prefix.install "modules/excel.so"
    write_config_file if build.with? "config-file"
  end
end
