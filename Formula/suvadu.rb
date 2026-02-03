class Suvadu < Formula
  desc "Never lose your trace. A high-performance, database-backed shell history."
  homepage "https://www.appachi.tech/downloads/suvadu/"
  version "0.0.10"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.10.tar.gz"
  sha256 "494b85813035c49af02b88225f7df8df94613d6651b175f52b93eee91a20be7d"

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
