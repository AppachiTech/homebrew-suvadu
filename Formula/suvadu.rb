class Suvadu < Formula
  desc "Never lose your trace. A high-performance, database-backed shell history."
  homepage "https://www.appachi.tech/downloads/suvadu/"
  version "0.0.11"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.11.tar.gz"
  sha256 "5a2916fcfc94659536fb01bd6266f2ac6ec1b22d6ffdfa43921bdf7da75368ed"

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
