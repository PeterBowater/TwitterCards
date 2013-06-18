<cfinclude template="plugin/config.cfm">
<cfsavecontent variable="twitterAdminBody">
<cfoutput>

<h3>Twitter Cards for Mura</h3>
<p>This plugin adds the necessary meta information to the page HEAD element to utilise the Twitter Cards</p>

<p> Read more here: <a href="https://dev.twitter.com/docs/cards">Twitter cards documentation</a>


</cfoutput>
</cfsavecontent>

<cfoutput>#$.getBean('pluginManager').renderAdminTemplate(
				body=twitterAdminBody,
				pageTitle=pluginConfig.getName(),
				jsLib="jQuery")# </cfoutput>
