class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.2"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.2.tar.gz"
  sha256 "dab073c729dad633da8647b2aadc754868ab75b4694974df5f3c3cb87512a83e"

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
