class Suvadu < Formula
  desc "Shell history search with AI agent command tracking and an MCP server"
  homepage "https://suvadu.sh/"
  version "0.5.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/macos/archive/suv-macos-v0.5.2.tar.gz"
      sha256 "a880bb8ea80d4ab37a26f52da2e849dadcd2dccd26a2eaac4c072f7cde55f4c3"
    else
      url "https://downloads.appachi.tech/macos/archive/suv-macos-x86_64-v0.5.2.tar.gz"
      sha256 "4e7f35387b7893d5d88aa2ab59ef0e524001a501e21bc79a3accb7061f100457"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.appachi.tech/linux/archive/suv-linux-aarch64-v0.5.2.tar.gz"
      sha256 "f9b8e7071e3391d79f6e16ec9b20991d3eef586eb8248e11838025751bc761fc"
    else
      url "https://downloads.appachi.tech/linux/archive/suv-linux-v0.5.2.tar.gz"
      sha256 "8b9d011cf9b0f818b76db698b13abeaa5c483f1e435b0c7e3b9e04d9485708f5"
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
