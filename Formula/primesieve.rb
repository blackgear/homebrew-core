class Primesieve < Formula
  desc "Fast C/C++ prime number generator"
  homepage "http://primesieve.org/"
  url "https://github.com/kimwalisch/primesieve/archive/v6.1.tar.gz"
  sha256 "c928a37072e12f9d7df1fe34e6523a9e3495f0ac7fce5835c9144821b74867ee"

  bottle do
    cellar :any
    sha256 "b350269dc60c22526ddb61086a252b982f9a519c0abde778a09933f37e514d8b" => :sierra
    sha256 "0cc700d26f7995d137c8b965e0173718a480960da462281ae09362ec98e12295" => :el_capitan
    sha256 "21b1dcd3d12577511352e47b6e724fb67b0e8296f151a6b6577b947c7c3e0fa4" => :yosemite
  end

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/primesieve", "100", "--count", "--print"
  end
end
