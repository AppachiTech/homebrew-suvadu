class Suvadu < Formula
  desc "Never lose your trace. A high-performance, database-backed shell history."
  homepage "https://www.appachi.tech/downloads/suvadu/"
  version "0.0.12"
  url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.0.12.tar.gz"
  sha256 "52c963ad89e962743cdb55656aa21c8a08ccd08ab270c70e5dc77025424ca2b7"

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
