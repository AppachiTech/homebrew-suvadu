class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.15"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.15.tar.gz"
  sha256 "8f8173e3ce1e013bfb6b56b0c1780fa9367b1479b41f57f8cd311929626f8bdd"

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
