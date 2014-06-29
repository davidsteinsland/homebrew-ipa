require 'formula'

class Libxl < Formula
  url 'ftp://xlware.com/libxl-mac-3.5.4.tar.gz'
  homepage 'http://libxl.com/'
  sha1 '929c4febb900355679b3f5b61887b3eb2426288c'

  def install
    lib.install 'lib/libxl.dylib'
    include.install Dir["include_c/*.h"]
  end

  def caveats; <<-EOS
    LibXl will write a banner in the first row of each spreadsheet and it will be able to
    read only 100 cells (first row is unavailable). Buy a license key to remove banner and reading restriction:
      http://libxl.com/purchase.html
    EOS
  end
end
