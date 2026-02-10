class Suvadu < Formula
  desc "Never lose your trace. A high-performance, database-backed shell history."
  homepage "https://www.appachi.tech/downloads/suvadu/"
  version "0.0.13"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.13.tar.gz"
  sha256 "94e6576b3f16589a841f52c7bf17f509c1a69824bf92e4ccd53e1a76febe8104"

  def install
    bin.install "suv"
    bin.install_symlink bin/"suv" => "suvadu"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      To start recording history, add this to your .zshrc:
        eval "$(suv init zsh)"
    EOS
  end

  test do
    assert_match "suvadu", shell_output("#{bin}/suv --version")
  end
end
