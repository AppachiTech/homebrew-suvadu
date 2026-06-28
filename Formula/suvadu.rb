class Suvadu < Formula
  desc "Total recall for your terminal"
  homepage "https://www.appachi.tech/suvadu/"
  license "MIT"
  head "https://github.com/AppachiTech/suvadu.git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.3.4.tar.gz"
      sha256 "be2e54ee98cccbb9f010212a6e1bf542a866c794cb4fc9120990876d7a305f72"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.3.4.tar.gz"
      sha256 "d4898e254b74785edd0d47e76043e76b4d847eabb78d46cbfbab4c3d531d2ff0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.3.4.tar.gz"
      sha256 "bba673eb2ea0aa44eb87f387116f018efd3f3089a8b7387cbc0119b70be3e659"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.3.4.tar.gz"
      sha256 "e8656d6eef11a62474851612f57b186479f5289f54bdf4920d9c625340733dba"
    end
  end

  def install
    bin.install "suv"
    bin.install_symlink bin/"suv" => "suvadu"
    prefix.install "LICENSE" if File.exist?("LICENSE")
  end

  def caveats
    if OS.mac?
      <<~EOS
        To start recording history, add this to your shell config:
          eval "$(suv init bash)"
      EOS

    else
      <<~EOS
        To start recording history, add this to your shell config:
          eval "$(suv init bash)"

        For zsh:
          eval "$(suv init zsh)"
      EOS
    end
  end

  test do
    assert_match "suv", shell_output("#{bin}/suv --help")
  end
end
