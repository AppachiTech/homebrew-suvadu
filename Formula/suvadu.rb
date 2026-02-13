class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.18"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.18.tar.gz"
  sha256 "63405bdac2a3610146478e00def5e880122b27f4426c2898ec5ee51ac52eb057"

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
