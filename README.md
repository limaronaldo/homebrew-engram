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

## Note

SHA256 hashes in the formula are placeholders until GitHub release binaries are published.
