class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.4.2.tar.gz"
      sha256 "8f245576d636e4503f1145defe31ea50ed17c73a37a0025c5f408d8f446cb664"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.4.2.tar.gz"
      sha256 "4dc0a2abd599f27f13e9629d95483d3a8b833ff7e5eecf698f59a3de363d8e7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.4.2.tar.gz"
      sha256 "a8a9e7b538c485a63a97b4bf93bc75b49d0f7ffb9e09ff9a67c4829cc9288b0e"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.4.2.tar.gz"
      sha256 "8863bd3ac79843d840217770b970169e95647e14f0f2a6c44a8d3b4ca1c20cf7"
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
