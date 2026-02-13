class Engram < Formula
  desc "Memory for production AI agents - hybrid search, knowledge graphs, MCP protocol"
  homepage "https://github.com/limaronaldo/engram"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7d6a8e65660861fa1b8c9eb96b83ce9a36e75544d4961b4d09bebd5e5563c982"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "249505a6fbe3f099e74011b6e28641b04eff0dc6dbf3a5cdfad3ea76d23d3d71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f995de9a51e5c9b3af0431960b89034998e603e90fe50a40ed408f300340d9e1"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e5f6052abc6a39eb6b2b89b8514bc5566fd610addca31804255b277cbe4b572"
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
