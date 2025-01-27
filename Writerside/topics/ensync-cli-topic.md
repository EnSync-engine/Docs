# EnSync CLI Tool

A command-line interface for interacting with the EnSync config management service.

---

## Table of Contents
1. [Installation](#installation)
2. [Configuration](#configuration)
3. [Usage](#usage)
    - [Event Management](#event-management)
    - [Access Key Management](#access-key-management)
    - [General Options](#general-options)
4. [Common Flags](#common-flags)
5. [Error Handling](#error-handling)
6. [Development](#development)

---
## Installation

### Using Curl

#### Download the CLI Tool
Choose the correct download command for your platform.

<tabs>
    <tab id="mac-extract-install" title="macOS (Darwin)">
        <code-block lang="shell">
            curl -L -o CLI_<version>_darwin_amd64.tar.gz https://github.com/EnSync-engine/CLI/releases/download/<version>/CLI_<version>_darwin_amd64.tar.gz
        </code-block>
    </tab>
    <tab id="linux-extract-install" title="Linux">
        <code-block lang="shell">
            curl -L -o CLI_<version>_linux_amd64.tar.gz https://github.com/EnSync-engine/CLI/releases/download/v1.0.0/CLI_1.0.0_linux_amd64.tar.gz
        </code-block>
    </tab>
    <tab id="windows-extract-install" title="Windows">
        <code-block lang="shell">
            curl -LO https://github.com/EnSync-engine/CLI/releases/download/<version>_windows_amd64.zip
        </code-block>
    </tab>
</tabs>

#### Extract the Downloaded Archive
<tabs>
    <tab id="mac-archive-install" title="macOS/Linux">
        <code-block lang="shell">
            tar -xvf CLI_{version}_{platform}_amd64.tar.gz
        </code-block>
    </tab>
    <tab id="windows-archive-install" title="Windows">
        <p>For `.zip` files, right-click the file and select **Extract All**, or use `7zip`:</p>
        <code-block lang="shell">
            7z x CLI_{version}_windows_amd64.zip
        </code-block>
    </tab>
</tabs>

#### Make the Binary Executable (macOS/Linux)
After extracting, make the binary executable (only for macOS/Linux):
<code-block lang="shell">
    chmod +x ensync-cli
</code-block>

#### Move the Binary to a Directory in Your PATH
To make the `ensync-cli` command accessible globally, move it to a directory included in your `PATH`.

<tabs>
    <tab id="mac-path-install" title="macOS/Linux">
        <code-block lang="shell">
            sudo mv ensync-cli /usr/local/bin/
        </code-block>
    </tab>
    <tab id="windows-path-install" title="Windows">
        <p>Move the `ensync-cli.exe` binary to a folder (e.g., `C:\Program Files\CLI\`) and add that folder to your `PATH` environment variable.</p>
        <p>Steps to update PATH on Windows:</p>
        <ol>
            <li>Open the Start Menu, search for "Environment Variables," and select "Edit the system environment variables."</li>
            <li>In the System Properties window, click on the "Environment Variables" button.</li>
            <li>Under "System variables," find and select the `Path` variable, then click "Edit."</li>
            <li>Click "New," and add the folder where you placed `ensync-cli.exe` (e.g., `C:\Program Files\CLI\`).</li>
            <li>Click "OK" to save your changes and close all dialogs.</li>
        </ol>
    </tab>
</tabs>

#### Verify the Installation
Confirm the tool was installed successfully by checking the version:
<code-block lang="shell">
    ensync-cli --version
</code-block>

This should output the version of the CLI tool that was installed.

### Using Go Install
If you have Go installed, you can install EnSync CLI directly using the `go install` command:
<code-block lang="shell">
 # Install the EnSync CLI tool
   go install github.com/EnSync-engine/CLI@latest
</code-block>

To install a specific version:
<code-block lang="shell">
   go install github.com/EnSync-engine/CLI/cmd@{version}
</code-block>

To install the latest version:
<code-block lang="shell">
   # Install the EnSync CLI tool
   go install github.com/CLI/ensync-cli@latest
</code-block>

**Notes:**
<code-block lang="plain text">
    1. Requires Go 1.17 or later.
    2. Ensure `$GOPATH/bin` (or `$GOBIN`) is in your system’s `PATH`.
</code-block>

### From Source
<code-block lang="shell">
   # Clone the repository
   git clone github.com/EnSync-engine/CLI
   cd ensync-cli
   # Build the binary
   make build
   # The binary will be available in bin/ensync
</code-block>

---

## Configuration

### Environment Variables
```bash
export ENSYNC_API_KEY="your-api-key"
export ENSYNC_BASE_URL="http://localhost:8080/api/v1/ensync"
```

---

## Usage

### Event Management

#### List Events
```bash
ensync-cli event list --access-key {your-access-key} --page 0 --limit 10 --order DESC --order-by createdAt

ensync-cli event list --access-key {your-access-key} --order ASC --order-by name
```

#### Create Event
```bash
ensync-cli event create --access-key {your-access-key} --name "test-event" --payload '{"key":"value","another":"data"}'
```

#### Update Event
```bash
ensync-cli event update --access-key {your-access-key} --id 1 --name "updated/name/name"

ensync-cli event update --access-key {your-access-key} --id 1 --payload '{"key":"new-value"}'

ensync-cli event get --access-key {your-access-key} --name "updated/name/name"

```

### Access Key Management

#### List Access Keys
```bash
ensync access-key list
```

#### Create Access Key
```bash
ensyncaccess-key  --access-key {your-access-key}  create --permissions '{"send": ["event1"], "receive": ["event2"]}'
```

#### Manage Permissions
```bash
ensync access-key  --access-key {your-access-key} permissions get --key "MyAccessKey"
ensync access-key permissions set --key "MyAccessKey" --permissions '{"send": ["event1"], "receive": ["event2"]}'
```

### General Options

#### Debug Mode
```bash
ensync --debug event list
```

#### Version Information
```bash
ensync version
ensync version --json
```

---

## Common Flags
- `--page`: Page number for pagination (default: 0)
- `--limit`: Number of items per page (default: 10)
- `--order`: Sort order (ASC/DESC)
- `--order-by`: Field to sort by (name/createdAt)
- `--debug`: Enable debug mode
- `--config`: Specify custom config file location

---

## Error Handling
- Exit code `0`: Success
- Exit code `1`: General error
- Exit code `2`: Configuration error
- Exit code `3`: API error

---

## Development

### Build
```bash
make build
```

### Run Tests
```bash
make test
make test-integration
```

### Lint
```bash
make lint
```

### Release
```bash
make release
```
---

## Initial Setup

### macOS/Linux

To simplify the configuration, add the environment variables to your shell configuration file:

1. Open your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or `~/.bash_profile`):
   ```bash
   nano ~/.bashrc
   ```

2. Add the following lines:
   ```bash
   export ENSYNC_BASE_URL="http://localhost:8080/api/v1/ensync"
   export ENSYNC_DEBUG=false
   ```

3. Save the file and apply the changes:
   ```bash
   source ~/.bashrc
   ```

### Windows

To set up environment variables on Windows:

1. Open the Start Menu, search for "Environment Variables," and select "Edit the system environment variables."
2. In the System Properties window, click on the "Environment Variables" button.
3. Under "System variables," click "New," and create two variables:
   - **Variable Name**: `ENSYNC_BASE_URL`
     **Variable Value**: `http://localhost:8080/api/v1/ensync`
   - **Variable Name**: `ENSYNC_DEBUG`
     **Variable Value**: `false`
4. Click "OK" to save the variables, then close all dialogs.
5. Open a new Command Prompt or PowerShell window to apply the changes.

---

### Environment Variables

Alternatively, you can configure the CLI using environment variables:

```bash
export ENSYNC_BASE_URL="http://localhost:8080/api/v1/ensync"
export ENSYNC_DEBUG=false
```

### Command-Line Flags

You can also provide the `accessKey` directly via the `--access-key` flag for each command:

```bash
ensync-cli --access-key "your-access-key" <command>
```

---

## Troubleshooting

- **Permission Issues**:
  - On **macOS/Linux**, you might need `sudo` to move the binary to a directory like `/usr/local/bin`.
  - On **Windows**, ensure you have the necessary permissions to modify the `PATH` and place the binary in the appropriate folder.

- **Command Not Found**:
  If the `ensync-cli` command doesn't work after installation, ensure that the binary is in your `PATH` and check the system's environment variables.

- **Access Key Errors**:
  If you encounter errors related to the `accessKey`, ensure that:
  - The `accessKey` is provided via the `--access-key` flag.
  - The `accessKey` is valid and has the necessary permissions.

---

### Conclusion

The CLI tool can be installed using `curl` and configured with either a configuration file, environment variables, or command-line flags. The `accessKey` is now required for all API interactions, and this guide provides instructions for installation and configuration across various platforms.