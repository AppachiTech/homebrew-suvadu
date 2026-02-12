class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.17"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.17.tar.gz"
  sha256 "e7cd0846e0e42ea0fbf2084dd4f5e3173ff698f45489ee28f8ab443695f4c721"

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
