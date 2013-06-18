<cfinclude template="plugin/config.cfm">
<cfsavecontent variable="twitterAdminBody">
<cfoutput>

<h3>Twitter Cards for Mura</h3>
<p>This plugin adds the necessary meta information to the page HEAD element to utilise the Twitter Cards</p>

<p> Read the Twitter Cards documentation here for a better understanding of what this plugin does: <a href="https://dev.twitter.com/docs/cards">Twitter cards documentation</a>

<p>For each site you enable the plugin, ensure you set in the Site Config the two values 'Twitter account name' and 'Default card description'. These values are used to populate two of the Twitter Card fields.</p>
</cfoutput>
</cfsavecontent>

<cfoutput>#$.getBean('pluginManager').renderAdminTemplate(
				body=twitterAdminBody,
				pageTitle=pluginConfig.getName(),
				jsLib="jQuery")# </cfoutput>
