class Engram < Formula
  desc "Memory for production AI agents - hybrid search, knowledge graphs, MCP protocol"
  homepage "https://github.com/limaronaldo/engram"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-macos-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-macos-x86_64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X86_64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_X86_64"
    end
  end

  def install
    bin.install "engram-server"
    bin.install "engram-cli"
  end

  def post_install
    (var/"lib/engram").mkpath
  end

  def caveats
    <<~EOS
      Engram stores its database at:
        ~/.local/share/engram/memories.db

      To use with MCP clients (Claude Code, Cursor, VS Code MCP extensions), add this server config in your MCP settings:
        {
          "mcpServers": {
            "engram": {
              "command": "#{opt_bin}/engram-server",
              "args": [],
              "env": {}
            }
          }
        }
    EOS
  end

  test do
    assert_match "engram", shell_output("#{bin}/engram-cli --version")
  end
end
