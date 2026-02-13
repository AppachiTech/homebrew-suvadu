class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.0.1"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.1.tar.gz"
  sha256 "dc664b91d7e2a8409c7c5fff958cb504a0acea3de462cbb1f37b685e61e0c85b"

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
