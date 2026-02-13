# Homebrew Engram

Homebrew tap for [Engram](https://github.com/limaronaldo/engram) - AI memory infrastructure.

## Installation

```bash
brew tap limaronaldo/engram
brew install engram
```

## Usage

```bash
# Run as MCP server (for Claude Code, Cursor, etc.)
engram-server

# CLI
engram-cli create "Important note" --tags "notes"
engram-cli search "important"
engram-cli stats
```

## MCP Configuration

After installing, add to your MCP config:

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

## Updating

```bash
brew update
brew upgrade engram
```

## Alternative Installation

```bash
# From crates.io (requires Rust toolchain)
cargo install engram-core

# From source
git clone https://github.com/limaronaldo/engram.git
cd engram && cargo install --path .
```
