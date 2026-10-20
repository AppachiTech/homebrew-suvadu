class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://suvadu.sh/"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.5.1.tar.gz"
      sha256 "bedf1f295a5babad5170dc195a288b15c97513efb988f43267fd58362607d200"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.5.1.tar.gz"
      sha256 "c02ec1d761a6f5579bec79fdb2de8216b121ac09a07ff163e60a295a386d8f0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.5.1.tar.gz"
      sha256 "5409713d89f27ded70e2f4a91ad04678c37d6e3a77dd09c4e30cccc1526982b2"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.5.1.tar.gz"
      sha256 "b4f22afebc63ca67409d76fd1ab3ed0319c7a739b38276a41514f4f35e5677a5"
    end
  end

  def install
    bin.install "suv"
    bin.install_symlink bin/"suv" => "suvadu"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      To start recording history, add the hook for your shell, then
      open a new terminal:
        Zsh:  echo 'eval "$(suv init zsh)"' >> ~/.zshrc
        Bash: echo 'eval "$(suv init bash)"' >> ~/.bashrc
      Check that commands are being recorded with: suv status
      Setup guide: https://suvadu.sh/cli/installation/
    EOS
  end

  test do
    assert_match "suvadu", shell_output("#{bin}/suv --version")
  end
end
