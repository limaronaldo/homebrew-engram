class Agentshield < Formula
  desc "Security scanner for AI agent extensions — MCP servers, SARIF output"
  homepage "https://github.com/limaronaldo/agentshield"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a1d80ce1f30936e5ec7d11f8a0fca9a07ddf1a6e70bf2278dc6f5e2288ee4204"
    else
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6c5107b09dca0480f0e6324eda281e9b687e5a2eef07bcaa2c4e41f7d4d14d88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63526ef5f5a4b99d9233f152e1d738dc7143e70eb3776a220f27e1938dce9067"
    else
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be19b2fe28b3a9c1b5e99e3709de5476d696f772d5f8fe33ae6842084dda9686"
    end
  end

  def install
    bin.install "agentshield"
  end

  def caveats
    <<~EOS
      AgentShield scans AI agent extensions for security vulnerabilities.

      Quick start:
        agentshield scan /path/to/mcp-server
        agentshield scan . --format html --output report.html
        agentshield list-rules

      Install from crates.io:
        cargo install agent-shield

      Documentation: https://github.com/limaronaldo/agentshield
    EOS
  end

  test do
    assert_match "SHIELD-001", shell_output("#{bin}/agentshield list-rules")
  end
end
