class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.4.0.tar.gz"
      sha256 "0e17741b70d07d52419eebbb7f6a9e1d60b598a4922b07ba414dc349f80e0d46"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.4.0.tar.gz"
      sha256 "623ca753f8f39e0ead9c3b13d75c8be2c95d788a9dd9fb66c5143ff04a4a38b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.4.0.tar.gz"
      sha256 "940210a0f5c7b52c5f428c7a701c41cdcfc3372f73ab6bf2bc4d4acbd1216981"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.4.0.tar.gz"
      sha256 "a429991c8c9c467a8606962879e3876f6257783a282efc36d22ecd7592b59161"
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
