class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.3.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.3.6.tar.gz"
      sha256 "a439fa3665ab32758ca4b33daafdba80a83a6b4f075acc7726d029f2cfc3832f"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.3.6.tar.gz"
      sha256 "50500c8c14ae6ae3b9979cf65946092fb9f2b5fa3a0e70a4ac0239f4bc44ab5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.3.6.tar.gz"
      sha256 "35297b1219071e27b9f92708423e8790ed153479ab6eb4d15eeab0352f913f59"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.3.6.tar.gz"
      sha256 "131d736e42800831c2ac4979f36cadcb40f59825ffaf65b9084ade5c1691ebf4"
    end
  end

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
