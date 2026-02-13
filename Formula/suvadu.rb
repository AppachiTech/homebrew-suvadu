class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.20"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.20.tar.gz"
  sha256 "ad02fd2e9954fd2af2676ed00934b42cf6b4924f106a2a328810b0ccf2d13d02"

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
