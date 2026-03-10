class Engram < Formula
  desc "Memory for production AI agents - hybrid search, knowledge graphs, MCP protocol"
  homepage "https://github.com/limaronaldo/engram"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3d631addccab4bae1a7ce894097d1e6513e72c58a9cd406aa58888f8c0059c9f"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9e2e1c6c681aaca5e1b17030b1ea340da8ab030dcd1a8c37e0c4f8d7ba8f9d5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d9fe610b83d31cc5402a37b8da112de4bb226bea76945b969b70d6906b4a2e6"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa95aaefed00cadf3980a4032ac205f5befa5bead7233171340651ca57187c08"
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
