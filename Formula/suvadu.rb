class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.4.1.tar.gz"
      sha256 "4b376d7d6d835519f7782f949ed828afcba7b3f8c917a3cce22b1ff44a330f10"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.4.1.tar.gz"
      sha256 "73ff533c630eda43543c46a45d842239b19680e3cfa37460481adf281f991de0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.4.1.tar.gz"
      sha256 "93ad915a56f468bc3f9c91ee38c0ae43cb641ad69fa0597ab9a58b681b1c9e2b"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.4.1.tar.gz"
      sha256 "befe8a9f12680cb4094de39a5f9c6875bde433f2fac1f73a82feab48ea6ca56b"
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
