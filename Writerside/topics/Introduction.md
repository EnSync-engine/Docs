<title>
    Welcome to EnSync Engine!
</title>
<p>EnSync Engine is a message delivery system aimed at enabling apps communicate natively and realtime with almost no friction.</p>
<chapter title="Introduction to EnSync Engine" id="introduction-to-ensync-engine">
<p>EnSync Engine provides sets of tools that enable apps that you integrate send and receive events/messages in realtime as if it were native to your organisation.</p>
<chapter title="What Makes Up EnSync Engine">
    <p>At the moment, the engine comprises two major parts which includes:</p>
    <deflist>
        <def title="Config Manager">
            <i>This part of the system powers the configuration and administration of the Engine. The config manager provides APIs which powers our CLI and are open to you for configuring and automating actions. It also provides GRPC services which are for internal use only. </i>
        </def>
        <def title="Node Engine">
            <i>The node engine acts as the delivery system which enables authorised clients securely publish messages which gets delivered to other connected clients. This service also handles archiving messages and partitioning storage files within your server.
                Our client SDKs connect to this part of the engine to publish, subscribe, acknowledge, pull records and
                more.</i>
        </def>
    </deflist>
</chapter>
<p>Before we continue, we wanted to clarify a couple of buzz words you may occasionally find in this documentation.</p>
<procedure title="Buzz Words" id="two-parts-engine">
    <step>
        <p>Events: <br/>
            <i>Notification that an action has occurred or a task has started, been updated or even completed.</i></p>
    </step>
    <step>
        <p>Messages:<br/>
            <i>An event with payload that may contain a header that is published by a system to update any listening service on progress of a
                task.</i>
        </p>
    </step>
</procedure>
</chapter>
<chapter title="Myths about EnSync:" id="myths-about-ensync">
<list>
    <li>EnSync Engine can only be used for third-party event/message delivery.</li>
    <li>You can't use EnSync Engine if you already have an event driven architecture.</li>
</list>
</chapter>
<chapter title="Facts about EnSync:" id="facts-about-ensync">
<list>
    <li>EnSync Engine is a central message delivery system.</li>
    <li>EnSync Engine can process thousands of messages per seconds.</li>
    <li>EnSync Engine can be used to build event driven architecture for your internal apps.</li>
    <li>EnSync Engine can</li>
</list>
</chapter>
<chapter title="Soon-to-be Facts about EnSync (some call this roadmaps):"
         id="soon-to-be-facts-about-ensync-some-call-this-roadmaps">
<list>
    <li>EnSync integrates with popular webhook delivery systems to enable native-like communication with third-parties
    </li>
    <li>EnSync supports native-like delivery and reception of events/messages from cloud-based third-parties</li>
</list>
<procedure title="Inject a procedure" id="inject-a-procedure">
    <step>
        <p>Start typing and select a procedure type from the completion suggestions:</p>
    </step>
    <step>
        <p>Press
            <shortcut>Tab</shortcut>
            or
            <shortcut>Enter</shortcut>
            to insert the markup.
        </p>
    </step>
</procedure>
</chapter>
<chapter title="Add interactive elements" id="add-interactive-elements">
<chapter title="Tabs" id="tabs">
    <p>To add switchable content, you can make use of tabs (inject them by starting to type <code>tab</code> on a new
        line):</p>
    <tabs>
        <tab title="Markdown">
            <code-block lang="plain text">![Alt Text](new_topic_options.png){ width=450 }</code-block>
        </tab>
        <tab title="Semantic markup">
        </tab>
    </tabs>
</chapter>
<chapter title="Collapsible blocks" id="collapsible-blocks">
    <p>Apart from injecting entire XML elements, you can use attributes to configure the behavior of certain elements.
        For example, you can collapse a chapter that contains non-essential information:</p>
    <chapter title="Supplementary info" id="supplementary-info" collapsible="true">
        <p>Content under such header will be collapsed by default, but you can modify the behavior by adding the
            following attribute:
            <code>default-state=&quot;expanded&quot;</code></p>
    </chapter>
</chapter>
<chapter title="Convert selection to XML" id="convert-selection-to-xml">
    <p>If you need to extend an element with more functions, you can convert selected content from Markdown to semantic
        markup.
        For example, if you want to merge cells in a table, it's much easier to convert it to XML than do this in
        Markdown.
        Position the caret anywhere in the table and press
        <shortcut>Alt+Enter</shortcut>
        :
    </p>

[//]: # (    <img src="convert_table_to_xml.png" alt="Convert table to XML" width="706" border-effect="line"/>)
</chapter>
</chapter>
<chapter title="Feedback and support" id="feedback-and-support">
<p>Please report any issues, usability improvements, or feature requests to our
    <a href="https://youtrack.jetbrains.com/newIssue?project=WRS">YouTrack project</a>
    (you will need to register).</p>
<p>You are welcome to join our
    <a href="https://join.slack.com/t/writerside/shared_invite/zt-1hnvxnl0z-Nc6RWXTppRI2Oc566vumYw">public Slack
        workspace</a>.
    Before you do, please read our <a
            href="https://plugins.jetbrains.com/plugin/20158-writerside/docs/writerside-code-of-conduct.html">Code of
        conduct</a>.
    We assume that you’ve read and acknowledged it before joining.</p>
<p>You can also always email <a href="mailto:writerside@jetbrains.com">writerside@jetbrains.com</a>.</p>
</chapter>
<seealso>
<category ref="wrs">
    <a href="https://plugins.jetbrains.com/plugin/20158-writerside/docs/markup-reference.html">Markup reference</a>
    <a href="https://plugins.jetbrains.com/plugin/20158-writerside/docs/manage-table-of-contents.html">Reorder topics in
        the TOC</a>
    <a href="https://plugins.jetbrains.com/plugin/20158-writerside/docs/local-build.html">Build and publish</a>
    <a href="https://plugins.jetbrains.com/plugin/20158-writerside/docs/configure-search.html">Configure Search</a>
</category>
</seealso>
