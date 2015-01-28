require 'formula'

class Htmldiff < Formula
  homepage 'https://github.com/davidsteinsland/htmldiff'
  url 'https://github.com/davidsteinsland/htmldiff/archive/1.0.tar.gz'
  sha1 'fe288dc25b8afe6a8a34a84a26d6bb4a62f8ed77'
  head 'https://github.com/davidsteinsland/htmldiff.git'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
