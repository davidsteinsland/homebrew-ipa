require 'formula'

class LibeventLatest < Formula
  homepage 'http://libevent.org'
  url 'https://github.com/libevent/libevent/archive/release-2.0.21-stable.tar.gz'
  sha1 '8a8813b2173b374cb64260245d7094fa81176854'

  head do
    url 'https://github.com/libevent/libevent.git'

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  if build.include? 'bleeding'
    url 'https://github.com/libevent/libevent/archive/release-2.1.4-alpha.tar.gz'
    sha1 '9b20faa45f8350c0f42ff6d00c5f0510d976784c'

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  option :universal
  option :bleeding, 'Install the latest alpha/beta release'

  def install
    ENV.universal_binary if build.universal?
    ENV.j1
    system "./autogen.sh" if build.head? or build.include? 'bleeding'

    system "./configure", "--disable-dependency-tracking",
                          "--enable-debug-mode",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
