class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.3.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.3.5.tar.gz"
      sha256 "3fbeb13c15c0a2c09cbfa207359f055ffd901e58e4474b16dc86feadee4480ee"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.3.5.tar.gz"
      sha256 "a92dfa593559c7506ef40414f503debc9e8f97479fad8044df4519a55d1e8a81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.3.5.tar.gz"
      sha256 "3ca844d947f6398f9b925a0c01546a0597645658c2cfaa6c54b9075e05609c10"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.3.5.tar.gz"
      sha256 "d7123ca7172912a7684f27026544060cff986294394e1615ed6e2c1bb7bc810e"
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
