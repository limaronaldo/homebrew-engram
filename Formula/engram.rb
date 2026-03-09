class Engram < Formula
  desc "Memory for production AI agents - hybrid search, knowledge graphs, MCP protocol"
  homepage "https://github.com/limaronaldo/engram"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c79e033efe91b8e99cacb9b2fef67e0321efa6aac9e2c6eb021d4c7212a84fe9"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d640bd6a484a9abac7f0d2364db8458cc8f578fe48ed32129177e977729cd7d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df3601dbf62574020523465c0bb10c60fc2651cf9240842dd41d2b70b462a3f4"
    else
      url "https://github.com/limaronaldo/engram/releases/download/v#{version}/engram-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9d04ad62a6867603a1abd890e10c1f41841c3bef13d2fbe6cfb98dd1a0bfd8b"
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
