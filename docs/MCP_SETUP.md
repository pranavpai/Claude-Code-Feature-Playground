# Figma MCP Server Setup Guide

Complete guide to configuring the Figma Model Context Protocol (MCP) server for use with the `figma-to-ios-frontend` sub-agent.

## Overview

The Figma MCP server provides two connection modes:

1. **Local Mode** - Connect to Figma Desktop app (requires Dev Mode enabled)
2. **Remote Mode** - Connect to Figma Cloud API (requires API access token)

This guide covers setup, configuration, testing, and troubleshooting for both modes.

## Prerequisites

### For All Users
- Claude Code CLI installed
- Active Figma account (Free, Professional, or Enterprise)
- This starter project cloned locally

### Local Mode Requirements
- Figma Desktop app installed
- Dev or Full seat (required for Dev Mode)
- macOS, Windows, or Linux supported

### Remote Mode Requirements
- Figma API access token
- Any Figma plan (Free, Professional, Organization, Enterprise)
- Internet connection

## Configuration File

The MCP server configuration is located at:
```
.claude/mcp.json
```

Default configuration:
```json
{
  "mcpServers": {
    "figma-local": {
      "url": "http://127.0.0.1:3845/mcp",
      "description": "Local Figma MCP server (Desktop app + Dev Mode)",
      "enabled": true,
      "transport": {
        "type": "sse"
      }
    },
    "figma-remote": {
      "url": "https://mcp.figma.com/mcp",
      "description": "Remote Figma MCP server (Cloud API)",
      "enabled": false,
      "transport": {
        "type": "sse"
      },
      "headers": {
        "Authorization": "Bearer ${FIGMA_ACCESS_TOKEN}"
      }
    }
  }
}
```

## Setup: Local Mode (Figma Desktop)

### Step 1: Install Figma Desktop

Download and install the Figma Desktop app:
- macOS: [Figma for Mac](https://www.figma.com/downloads/)
- Windows: [Figma for Windows](https://www.figma.com/downloads/)
- Linux: [Figma for Linux](https://www.figma.com/downloads/)

### Step 2: Verify Dev Mode Access

1. Open Figma Desktop
2. Open any file
3. Press `Shift+D` to toggle Dev Mode
4. Verify the Dev Mode panel appears on the right

If Dev Mode is unavailable:
- You need a Dev or Full seat
- Contact your workspace admin to upgrade
- Or use Remote Mode instead

### Step 3: Enable MCP Server in Figma

The MCP server runs automatically when:
- Figma Desktop is running
- Dev Mode is enabled (Shift+D)

The server is available at: `http://127.0.0.1:3845/mcp`

### Step 4: Verify Connection

Check if the MCP server is running:

```bash
# Test health endpoint
curl http://127.0.0.1:3845/health

# Expected response:
# {"status":"ok"}
```

### Step 5: Configure Claude Code

The default configuration in `.claude/mcp.json` already has local mode enabled:

```json
{
  "mcpServers": {
    "figma-local": {
      "url": "http://127.0.0.1:3845/mcp",
      "enabled": true,
      "transport": { "type": "sse" }
    }
  }
}
```

No changes needed if using local mode only.

### Step 6: Test MCP Tools

In Claude Code CLI or IDE:

```
List available MCP servers:
/mcp list

Expected output should include:
- figma-local (connected)
```

### Local Mode Workflow

1. Launch Figma Desktop
2. Open a design file
3. Enable Dev Mode (Shift+D)
4. Open Claude Code in your IDE
5. Invoke sub-agent with Figma file URL

Example prompt:
```
Extract the design system from the current Figma file
```

The sub-agent will use `mcp__figma__get-local-variables` and other local tools.

## Setup: Remote Mode (Cloud API)

### Step 1: Generate API Token

1. Go to [Figma Account Settings](https://www.figma.com/settings)
2. Scroll to "Personal access tokens"
3. Click "Generate new token"
4. Name it (e.g., "Claude Code MCP")
5. Copy the token (format: `figd_...`)

**Important**: Save the token immediately. You cannot view it again.

### Step 2: Set Environment Variable

Add your token to your shell configuration:

**For Bash (~/.bashrc or ~/.bash_profile):**
```bash
export FIGMA_ACCESS_TOKEN="figd_your_token_here"
```

**For Zsh (~/.zshrc):**
```bash
export FIGMA_ACCESS_TOKEN="figd_your_token_here"
```

**For Fish (~/.config/fish/config.fish):**
```fish
set -x FIGMA_ACCESS_TOKEN "figd_your_token_here"
```

Then reload your shell:
```bash
source ~/.bashrc  # or ~/.zshrc, etc.
```

Verify the variable is set:
```bash
echo $FIGMA_ACCESS_TOKEN
# Should output: figd_your_token_here
```

### Step 3: Update MCP Configuration

Edit `.claude/mcp.json`:

```json
{
  "mcpServers": {
    "figma-local": {
      "url": "http://127.0.0.1:3845/mcp",
      "enabled": false,  // Disable local mode
      "transport": { "type": "sse" }
    },
    "figma-remote": {
      "url": "https://mcp.figma.com/mcp",
      "enabled": true,   // Enable remote mode
      "transport": { "type": "sse" },
      "headers": {
        "Authorization": "Bearer ${FIGMA_ACCESS_TOKEN}"
      }
    }
  }
}
```

**Key changes:**
- Set `figma-local.enabled` to `false`
- Set `figma-remote.enabled` to `true`

### Step 4: Verify Connection

Test the remote connection:

```bash
# Test with curl (replace $FIGMA_ACCESS_TOKEN with your actual token)
curl -H "Authorization: Bearer $FIGMA_ACCESS_TOKEN" \
  https://api.figma.com/v1/me

# Expected: JSON response with your user info
```

### Step 5: Test MCP Tools

In Claude Code:

```
/mcp list

Expected output should include:
- figma-remote (connected)
```

### Remote Mode Workflow

1. Set `FIGMA_ACCESS_TOKEN` environment variable
2. Update `.claude/mcp.json` to enable remote mode
3. Open Claude Code in your IDE
4. Invoke sub-agent with Figma file URL (must include file key)

Example prompt:
```
Extract the design system from https://figma.com/file/abc123xyz/MyDesign
```

The sub-agent will use `mcp__figma__get-file`, `mcp__figma__get-node`, etc.

## MCP Tools Reference

### Available Tools (Local Mode)

When connected to Figma Desktop:

- `mcp__figma__get-local-variables` - Get design tokens (colors, typography, spacing)
- `mcp__figma__get-current-selection` - Get currently selected nodes
- `mcp__figma__get-current-file` - Get metadata for open file

### Available Tools (Remote Mode)

When connected to Cloud API:

- `mcp__figma__get-file` - Get file structure and metadata
- `mcp__figma__get-node` - Get specific frame, component, or layer
- `mcp__figma__get-components` - List all components in a file
- `mcp__figma__get-component-sets` - Get component variants
- `mcp__figma__get-styles` - Get text, color, and effect styles
- `mcp__figma__get-variables` - Get design tokens and variables

### Example Tool Calls

**Get design variables (local):**
```
Sub-agent uses:
mcp__figma__get-local-variables

Returns:
{
  "collections": [...],
  "variables": [
    { "name": "Primary", "valuesByMode": {...} },
    { "name": "Spacing/M", "valuesByMode": {...} }
  ]
}
```

**Get file structure (remote):**
```
Sub-agent uses:
mcp__figma__get-file
Parameters: { "file_key": "abc123xyz" }

Returns:
{
  "name": "MyDesign",
  "document": {
    "children": [...]
  }
}
```

**Get specific frame (remote):**
```
Sub-agent uses:
mcp__figma__get-node
Parameters: {
  "file_key": "abc123xyz",
  "node_id": "123:456"
}

Returns:
{
  "name": "Login Screen",
  "type": "FRAME",
  "children": [...],
  "layoutMode": "VERTICAL"
}
```

## Switching Between Modes

You can keep both configurations in `.claude/mcp.json` and switch by toggling `enabled`:

**Use Local Mode:**
```json
{
  "mcpServers": {
    "figma-local": { "enabled": true },
    "figma-remote": { "enabled": false }
  }
}
```

**Use Remote Mode:**
```json
{
  "mcpServers": {
    "figma-local": { "enabled": false },
    "figma-remote": { "enabled": true }
  }
}
```

**Note**: Only enable one at a time to avoid conflicts.

## Troubleshooting

### Local Mode Issues

**Problem**: "Cannot connect to http://127.0.0.1:3845/mcp"

Solutions:
1. Verify Figma Desktop is running
2. Enable Dev Mode (Shift+D)
3. Check health endpoint: `curl http://127.0.0.1:3845/health`
4. Restart Figma Desktop
5. Check firewall settings (allow port 3845)

**Problem**: "Dev Mode not available"

Solutions:
1. Verify you have a Dev or Full seat
2. Contact workspace admin to upgrade
3. Use Remote Mode instead

**Problem**: "MCP server not responding"

Solutions:
1. Quit and restart Figma Desktop
2. Update Figma Desktop to latest version
3. Check Console.app (macOS) or Event Viewer (Windows) for errors
4. Try disabling VPN or proxy

### Remote Mode Issues

**Problem**: "Authentication failed"

Solutions:
1. Verify `FIGMA_ACCESS_TOKEN` is set: `echo $FIGMA_ACCESS_TOKEN`
2. Check token format (should start with `figd_`)
3. Generate new token at figma.com/settings
4. Ensure token is not expired
5. Reload shell after setting variable

**Problem**: "File not found"

Solutions:
1. Verify file URL is correct
2. Check you have access to the file in Figma
3. Use file key from URL (https://figma.com/file/**abc123xyz**/FileName)
4. Ensure file is not deleted or moved

**Problem**: "Rate limit exceeded"

Solutions:
1. Wait 60 seconds before retrying
2. Reduce number of API calls
3. Consider upgrading Figma plan for higher limits
4. Use local mode if available (no rate limits)

### General Issues

**Problem**: "/mcp list shows no servers"

Solutions:
1. Verify `.claude/mcp.json` exists and is valid JSON
2. Check at least one server has `"enabled": true`
3. Restart Claude Code CLI or IDE
4. Check Claude Code logs for errors

**Problem**: "Sub-agent not using MCP tools"

Solutions:
1. Verify MCP server is enabled: `/mcp list`
2. Check sub-agent has access to tools (no `tools:` restriction)
3. Provide explicit Figma URL in prompt
4. Check Claude Code logs for permission errors

## Security Best Practices

### For Access Tokens

1. **Never commit tokens to git**
   - Add to `.gitignore`: `.env`, `*.local`, `.claude/secrets.json`
   - Use environment variables only

2. **Rotate tokens regularly**
   - Generate new token every 90 days
   - Revoke old tokens in Figma settings

3. **Limit token scope**
   - Only use tokens for MCP server access
   - Don't share tokens across projects

4. **Secure storage**
   - Use password manager for backup
   - Don't store in plain text files

### For Local Mode

1. **Enable Dev Mode only when needed**
   - Disable when not using MCP tools
   - Reduces attack surface

2. **Firewall configuration**
   - Restrict port 3845 to localhost only
   - Don't expose to network

## Performance Tips

### Local Mode
- Faster for real-time design iteration
- No rate limits
- Works offline (if file is open)

### Remote Mode
- Better for CI/CD pipelines
- No Figma Desktop required
- Accessible from any machine
- Rate limits: 1000 requests/hour (Free), 5000/hour (Professional+)

### Optimization
- Cache design tokens locally after first fetch
- Batch MCP calls when possible
- Use specific node IDs instead of traversing entire file
- Enable only one MCP server at a time

## Additional Resources

- [Figma MCP Server Guide](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server)
- [Figma MCP Developer Docs](https://developers.figma.com/docs/figma-mcp-server/)
- [Figma REST API Documentation](https://www.figma.com/developers/api)
- [Claude Code MCP Documentation](https://code.claude.com/docs/mcp)
- [Model Context Protocol Spec](https://modelcontextprotocol.io/)

## Support

If you encounter issues not covered here:

1. Check [Figma Community Forum](https://forum.figma.com/)
2. Review [Claude Code GitHub Issues](https://github.com/anthropics/claude-code/issues)
3. Consult [Figma Developer Slack](https://figma.com/developers)

---

**Last Updated**: December 2025
