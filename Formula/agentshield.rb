class Agentshield < Formula
  desc "Security scanner for AI agent extensions — MCP servers, SARIF output"
  homepage "https://github.com/limaronaldo/agentshield"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "31a053dc1d28977e2456bdfb647f5c7431f0214138c56aa64deec4747fcaaff4"
    else
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ae54e1db38c46944f52b75ccdf94574ae398368a7e44bc716fbbe80b24dcb4a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb57e30f5b43dbde9243bfc0c874ce49834bc858366aa11ca604f54b8d23f47f"
    else
      url "https://github.com/limaronaldo/agentshield/releases/download/v#{version}/agentshield-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3af3cb61934bbd0dccb27ed347c9f80ff332b3680a647e5458560019485954a1"
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
