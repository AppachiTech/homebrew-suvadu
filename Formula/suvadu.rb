class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://suvadu.sh/"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.5.0.tar.gz"
      sha256 "486c5ea7c536d3750e306d5a813fd5566ccabc89e395c6fcfd8d1be8b717c0a2"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.5.0.tar.gz"
      sha256 "8e850c7a7ebac8d8338d2ef1024d4aa449c96ccb41c083ca0a52c92f1c841f33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.5.0.tar.gz"
      sha256 "4646633a54ce29b3b41a80670fbaac41d70d3e9ac73ad620072cc27e3877b442"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.5.0.tar.gz"
      sha256 "97d7786a2eb0dcf9a3d8bc71809190d54904e615c58b1393a2c863228c05ac34"
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
