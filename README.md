# Homebrew Tap

Homebrew tap for [Engram](https://github.com/limaronaldo/engram) and [AgentShield](https://github.com/limaronaldo/agentshield).

## Formulas

| Formula | Version | Description |
|---------|---------|-------------|
| `engram` | 0.5.0 | AI memory infrastructure — hybrid search, knowledge graphs, MCP protocol |
| `agentshield` | 0.2.0 | Security scanner for AI agent extensions — SARIF output, 12 detectors |

## Installation

```bash
brew tap limaronaldo/engram

# Engram — AI memory for agents
brew install engram

# AgentShield — security scanner
brew install agentshield
```

## Engram Usage

```bash
# Run as MCP server (for Claude Code, Cursor, etc.)
engram-server

# CLI
engram-cli create "Important note" --tags "notes"
engram-cli search "important"
engram-cli stats
```

### MCP Configuration

Add to your MCP config (`~/.claude/mcp.json`, `.cursor/mcp.json`, etc.):

```json
{
  "mcpServers": {
    "engram": {
      "command": "engram-server",
      "args": [],
      "env": {}
    }
  }
}
```

## AgentShield Usage

```bash
# Scan an MCP server for security issues
agentshield scan /path/to/mcp-server

# Generate HTML report
agentshield scan . --format html --output report.html

# SARIF for GitHub Code Scanning
agentshield scan . --format sarif --output results.sarif

# List all detection rules
agentshield list-rules
```

## Updating

```bash
brew update
brew upgrade engram
brew upgrade agentshield
```

## Alternative Installation

```bash
# From crates.io (requires Rust toolchain)
cargo install engram-core
cargo install agent-shield

# From source
git clone https://github.com/limaronaldo/engram.git
cd engram && cargo install --path .

git clone https://github.com/limaronaldo/agentshield.git
cd agentshield && cargo install --path .
```
