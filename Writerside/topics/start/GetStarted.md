<title>Self-host EnSync</title>
<p>EnSync provides public images on Docker hub which can be used on almost any container engine (OCI compliant).</p>
<deflist>
    <def title="EnSync Components">
        <p>EnSync consists of two major components that work together to provide a complete event delivery system:</p>
        <table>
            <tr><th>Component</th><th>Description</th><th>Key Features</th><th>Network Ports</th></tr>
            <tr>
                <td>Master Node (EnSync Node)</td>
                <td>Core component responsible for handling all client interactions and event management operations</td>
                <td><list><li>Event publishing</li><li>Event subscribing</li><li>Event pulling</li><li>Rollback operations</li><li>Event acknowledgment handling</li></list></td>
                <td><list><li>8443 (HTTP/2)</li><li>8082 (HTTP/1)</li></list></td>
            </tr>
            <tr>
                <td>Config Manager</td>
                <td>Control plane for EnSync, providing management and configuration capabilities</td>
                <td><list><li>Access control management</li><li>Event structure definition</li><li>Event workspace management</li><li>System settings configuration</li></list></td>
                <td>8080 (API endpoint)</td>
            </tr>
        </table>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Download EnSync Service">Download <b><resource src="./compose.yml"/></b> and open it.</def>
    <def title="Start EnSync Service and set Environment variables">
        Download <b><resource src="./engine.sh"/></b> and open it.
        <p>The engine.sh script is a helper script that simplifies the process of running EnSync by:</p>
        <list>
            <li>Setting configurable environment variables automatically</li>
            <li>Providing simple commands to manage the EnSync service:
                <list>
                    <li>Start services: <code>./engine.sh</code></li>
                    <li>Stop services: <code>./engine.sh down</code></li>
                </list>
            </li>
        </list>
    </def>
</deflist>
<br/>
<deflist>
    <def title="HTTP/2 Configuration">
        <p>For HTTP/2 connections (port 8443), EnSync requires a valid certificate for request authorization.</p>
        <list>
            <li>Set up a valid certificate for HTTP/2 connections</li>
            <li>Configure the ENSYNC_CERT_PATH environment variable to point to your certificate file</li>
        </list>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Environment Variables">
        <p>The following environment variables are used to configure EnSync:</p>
        <table>
            <tr><th>Variable Name</th><th>Default Value</th><th>Purpose</th></tr>
            <tr><td>STORAGE_DIR</td><td><format color="Red">Required</format></td><td>Specifies the storage location for event records</td></tr>
            <tr><td>ENSYNC_UID</td><td><format color="Red">Required</format></td><td>User ID for the EnSync Node service</td></tr>
            <tr><td>ENSYNC_GID</td><td><format color="Red">Required</format></td><td>Group ID for the EnSync Node service</td></tr>
            <tr><td>ENSYNC_CERT_PATH</td><td><format color="Red">Required for HTTP/2</format></td><td>Path to the JKS signed certificate file used for HTTP/2 request authorization</td></tr>
            <tr><td>ENSYNC_CLEAN_UP</td><td>200ms</td><td>Controls how frequently EnSync cleans up stored events from memory</td></tr>
            <tr><td>ENSYNC_CLEAN_UP_TO</td><td>200ms</td><td>Specifies how long events can remain in the Ready-to-go Queue before being cleaned up</td></tr>
            <tr><td>ENSYNC_CONFIG_MANAGER_URL</td><td>http://config-manager:8080</td><td>Defines the connection endpoint for the Config Manager service</td></tr>
        </table>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Critical Warnings">
        <warning>Before running the script, make sure to modify the STORAGE_DIR variable to point to your desired storage location. The default value of "/" is not recommended for production use.</warning>
        <br/>
        <warning>The storage directory contains critical event data and should never be manually modified or tampered with, as this can disrupt EnSync's operation.</warning>
        <br/>
        <warning>Setting ENSYNC_CLEAN_UP too high can impact system performance due to large amounts of information being held in the Ready-to-go Queue.</warning>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Important Setup Requirements">
        <important>The STORAGE_DIR environment variable must be set before running the compose.yml file, as it is required for volume mounting and internal usage.</important>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Event Management Notes">
        <note>When an event is cleaned up from the Ready-to-go Queue, it is not permanently deleted. Events remain available for replay functionality as long as:
            <list><li>The event metadata field PERSIST was not set to false during publishing</li><li>The event is within the storage retention period</li></list>
        </note>
        <br/>
        <note>By default, all events are configured with PERSIST = true in their metadata, enabling EnSync's replay functionality.</note>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Configuration Notes">
        <note>HTTP/2 configuration is optional. If you don't plan to use HTTP/2 connections, you can continue using HTTP/1 on port 8082 without certificate setup.</note>
        <br/>
        <note>The ENSYNC_CONFIG_MANAGER_URL only needs to be modified if you need to use a different Config Manager service than the one provided in the default Docker Compose setup.</note>
    </def>
</deflist>
<br/>
<deflist>
    <def title="Best Practices">
        <tip>The script automatically detects your user's UID and GID, ensuring proper file permissions for the EnSync Node service.</tip>
        <br/>
        <tip>Ensure the STORAGE_DIR points to a directory with adequate storage capacity and appropriate read/write permissions.</tip>
    </def>
</deflist>