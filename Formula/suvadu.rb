class Suvadu < Formula
  desc "Total recall for your terminal."
  homepage "https://www.appachi.tech/suvadu/"
  version "0.3.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.3.7.tar.gz"
      sha256 "7438bf2948ac470ae8783007d269c6f0ac4c08e6ea7df09cdc7da6a60af61f0e"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.3.7.tar.gz"
      sha256 "6a2f9842c074ebaeabfff028db18cf221ff83a0134dc6e3075eb44eec1576638"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.3.7.tar.gz"
      sha256 "55700c897cf18b8c7003c7c05093e3730b647f10baa1a643c8921d22a8fc5183"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.3.7.tar.gz"
      sha256 "905dd0a475ab7e08e8f8b184a9eeba19dc001831cf4402dc0aa2af2ae58b97c8"
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
