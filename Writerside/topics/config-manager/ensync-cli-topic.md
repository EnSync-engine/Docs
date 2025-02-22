# EnSync CLI Tool

A command-line interface for interacting with the EnSync config management service.

---

## Table of Contents
1. [Installation](#installation)
2. [Configuration](#configuration-initial-setup)
3. [Usage](#usage)
    - [Event Management](#event-management)
    - [Access Key Management](#access-key-management)
    - [General Options](#general-options)
4. [Common Flags](#common-flags)
5. [Error Handling](#error-handling)


---
## Installation
<tabs>
    <tab id="curl-install" title="Using Curl">
        <b>Download the CLI Tool</b>
         <p>Choose the correct download command for your platform.</p>
         <tabs>
            <tab id="mac-extract-install" title="macOS (Darwin)">
            <code-block lang="shell">curl -L -o CLI_1.0.1_darwin_amd64.tar.gz https://github.com/EnSync-engine/CLI/releases/download/v1.0.1/CLI_1.0.1_darwin_amd64.tar.gz</code-block>
            </tab>
            <tab id="linux-extract-install" title="Linux">
            <code-block lang="shell">curl -L -o CLI_1.0.1_linux_amd64.tar.gz https://github.com/EnSync-engine/CLI/releases/download/v1.0.1/CLI_1.0.1_linux_amd64.tar.gz</code-block>
            </tab>
            <tab id="windows-extract-install" title="Windows">
            <code-block>
               curl -LO https://github.com/EnSync-engine/CLI/releases/download/CLI_1.0.1_windows_amd64.zip
            </code-block>
         </tab>
         </tabs>
         <br/>
         <b>Extract the Downloaded Archive</b>
         <tabs>
            <tab id="mac-archive-install" title="macOS/Linux">
            <code-block lang="shell">tar -xvf CLI_1.0.1_{platform}_amd64.tar.gz</code-block>
            </tab>
            <tab id="windows-archive-install" title="Windows">
            <p>For `.zip` files, right-click the file and select **Extract All**, or use `7zip`:</p>
            <code-block>
               7z x CLI_1.0.1_windows_amd64.zip
            </code-block>
         </tab>
         </tabs>
         <br/>
         <b>Make the Binary Executable (macOS/Linux)</b>
         <p>After extracting, make the binary executable (only for macOS/Linux):</p>
            <code-block>
               chmod +x ensync-cli
            </code-block>
         <br/>
         <b>Move the Binary to a Directory in Your PATH</b>
         <p>To make the `ensync-cli` command accessible globally, move it to a directory included in your `PATH`.</p>
         <deflist>
            <def title="macOS/Linux"><code-block lang="shell">sudo mv ensync-cli /usr/local/bin/</code-block></def>
            <def title="Windows">
               Move the `ensync-cli.exe` binary to a folder (e.g., `C:\Program Files\CLI\`) and add that folder to your `PATH` environment variable.
              <p>Steps to update PATH on Windows:</p>
              <ol>
                  <li>Open the Start Menu, search for "Environment Variables," and select "Edit the system environment variables."</li>
                  <li>In the System Properties window, click on the "Environment Variables" button.</li>
                  <li>Under "System variables," find and select the `Path` variable, then click "Edit."</li>
                  <li>Click "New," and add the folder where you placed `ensync-cli.exe` (e.g., `C:\Program Files\CLI\`).</li>
                  <li>Click "OK" to save your changes and close all dialogs.</li>
              </ol>
            </def>
         </deflist>
         <br/>
         <b>Verify the Installation</b>
         <p>Confirm the tool was installed successfully by checking the version:</p>
         <code-block lang="shell">ensync-cli --version</code-block>
         <p>This should output the version of the CLI tool that was installed.</p>
    </tab>
    <tab id="go-install" title="Using Go Install">
         If you have Go installed, you can install EnSync CLI directly using the `go install` command:
        <code-block lang="shell">
            # Install the EnSync CLI tool
            go install github.com/rossi1/ensync-cli@latest
         </code-block>
         To install a specific version:
         <code-block lang="shell">
            go install github.com/ensync-cli/cmd/ensync@v1.0.1
         </code-block>
         To install the latest version:
         <code-block lang="shell">
            # Install the EnSync CLI tool
            go install github.com/rossi1/ensync-cli@latest
         </code-block>
         <b>Notes:</b>
         <code-block lang="plain text">
            1. Requires Go 1.17 or later.
            2. Ensure `$GOPATH/bin` (or `$GOBIN`) is in your system’s `PATH`.
         </code-block>
       </tab>
       <tab id="from-source" title="From Source">
            <code-block lang="shell">
               # Clone the repository
               git clone https://github.com/rossi1/ensync-cli
               cd ensync-cli
               # Build the binary
               make build
               # The binary will be available in bin/ensync
         </code-block>
    </tab>
</tabs>

---

## Configuration/Initial Setup

### macOS/Linux

To simplify the configuration, add the environment variables to your shell configuration file:

1. Open your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or `~/.bash_profile`):
   ```bash
   nano ~/.bashrc
   ```

2. Add the following lines:
   ```bash
   export ENSYNC_BASE_URL="http://{url}/api/v1/ensync"
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
     **Variable Value**: `http://{url}/api/v1/ensync`
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

---

## Usage

### Event Management

#### List Events
```bash
ensync-cli  --access-key {access-key} event list  --page 0 --limit 10 --order DESC --order-by createdAt
```
Example 2
```bash
ensync-cli --access-key {access-key} event list --order ASC --order-by name
```
<br/>

#### Create Event
```bash
ensync-cli event create --access-key {access-key} --name "test-event" --payload '{"key":"value","another":"data"}'
```
<br/>

#### Update Event
```bash
ensync-cli --access-key {access-key} event update  --id 1 --name "updated/name/name"

ensync-cli --access-key {access-key} event update  --id 1 --payload '{"key":"new-value"}'

ensync-cli --access-key {access-key} event get --name "updated/name/name"

```
<br/>

### Access Key Management

#### List Access Keys
```bash
ensync-cli --access-key {access-key} access-key list 
```

#### Create Access Key
```bash
ensync-cli --access-key {access-key} access-key create --permissions '{"send": ["event1"], "receive": ["event2"]}'
```

#### Set Permissions
```bash
ensync-cli --access-key {access-key} access-key permissions set --key {access-key} --permissions '{"send": ["event1"], "receive": ["event2"]}'
```

#### Get Permissions
```bash
ensync-cli --access-key {access-key} access-key permissions get --key {access-key}
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
