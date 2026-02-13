class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.19"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.19.tar.gz"
  sha256 "930637afd3918feb3165affbafae44d52ab2527efda6a6c1636e87571fd71c6e"

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
