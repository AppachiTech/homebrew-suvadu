class Suvadu < Formula
  desc "Never lose your trace. A high-performance, database-backed shell history."
  homepage "https://www.appachi.tech/downloads/suvadu/"
  version "0.0.14"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.14.tar.gz"
  sha256 "b383e8a1ba17e282b8a7ff4e3eae2dccddd20f643ce513914308ca5cbec2aa46"

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
