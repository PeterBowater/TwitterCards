<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	
	<cffunction name="onApplicationLoad">
	    <cfargument name="$">
	    <cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onRenderStart" output="false" returntype="any">
	    <cfargument name="$">
	    <cfHTMLHead text='#makeTwitterMeta($)#'>
	</cffunction>
	
	<cffunction name="makeTwitterMeta" description="Creates valid Twitter card metadata output" output="true">
		<cfargument name="$">
		<cfset var cardType = "summary">
		<cfset var incImage = true>
		<cfset var twitterMeta = "">
		<cfif cgi.server_port_secure eq 0>
			<cfset protocol = 'http://'>
		<cfelse>
			<cfset protocol = 'https://'>
		</cfif>
		
		<cfswitch expression="#$.content().getValue('type')#">
		
			<cfcase value="Gallery">
				<cfset cardType="gallery">
				
				<cfset twitterMeta = '<meta name="twitter:card" content="#cardType#" />
<meta name="twitter:site" content="#$.siteConfig().getValue("twitterHandle")#" />
<meta name="twitter:title" content="#$.content().getValue("title")#" />'>
				<cfif len(stripHTMLandTruncate($.content().getValue("summary")))>
					<cfset twitterMeta &='<meta name="twitter:description" content="#stripHTMLAndTruncate($.content().getValue("summary"))#" />'>
				<cfelseif len(stripHTMLandTruncate($.content().getValue("body")))>
					<cfset twitterMeta &='<meta name="twitter:description" content="#stripHTMLAndTruncate($.content().getValue("body"))#" />'>
				<cfelse>
					<cfset twitterMeta &='<meta name="twitter:description" content="Read more on our site" />'>
				</cfif>
				<cfset theGalleryImages = application.contentManager.getActiveContent($.content().getContentID(), $.event('siteid'))>
				<cfset item = theGalleryImages.getKidsIterator()>
				<cfloop condition="#item.hasNext()# and item.currentIndex() LTE 3">
				  <!--- Get the next item; returns a contentBean --->
				  <cfset thisImage = item.next()>
				  <cfset twitterMeta &= '<meta name="twitter:image#item.currentIndex()-1#" content="#protocol##cgi.http_host##thisImage.getImageURL()#" />'>
				</cfloop>
			
			</cfcase>
			
			<cfdefaultcase>
				<cfif len($.content().getImageURL())>
					<cfimage action="info" source="#protocol##cgi.http_host##$.content().getImageURL()#" structname="thisAssocImage">	
					<cfif thisAssocImage.width GTE 280 and thisAssocImage.height GTE 150>
						<cfset cardType = "summary_large_image">
					<cfelseif thisAssocImage.width GTE 60 and thisAssocImage.height GTE 60>
						<cfset cardType = "summary">		
					<cfelse>
						<cfset incImage = false>
					</cfif>
				<cfelse>
					<cfset incImage = false>
				</cfif>
				
				<cfset twitterMeta = '<meta name="twitter:card" content="#cardType#" />
		<meta name="twitter:site" content="#$.siteConfig().getValue("twitterHandle")#" />
		<meta name="twitter:title" content="#$.content().getValue("title")#" />'>
				
				<cfif len(stripHTMLandTruncate($.content().getValue("summary")))>
					<cfset twitterMeta &='<meta name="twitter:description" content="#stripHTMLAndTruncate($.content().getValue("summary"))#" />'>
				<cfelseif len(stripHTMLandTruncate($.content().getValue("body")))>
					<cfset twitterMeta &='<meta name="twitter:description" content="#stripHTMLAndTruncate($.content().getValue("body"))#" />'>
				<cfelse>
					<cfset twitterMeta &='<meta name="twitter:description" content="Read more on our site" />'>
				</cfif>
				<cfif incImage>		
					<cfset twitterMeta &= '<meta name="twitter:image" content="#protocol##cgi.http_host##$.content().getImageURL()#" />'>
				</cfif>				
			</cfdefaultcase>
		</cfswitch>
		<cfreturn twitterMeta>
	</cffunction>

	<cffunction name="stripHTMLAndTruncate" output="no" returnType="string">
		<cfargument name="str" required="yes">
		<cfset str = reReplaceNoCase(str, "<*style.*?>(.*?)</style>","","all")>
		    <cfset str = reReplaceNoCase(str, "<*script.*?>(.*?)</script>","","all")>
		    <cfset str = reReplaceNoCase(str, "<.*?>","","all")>
		    <cfset str = reReplaceNoCase(str, "^.*?>","")>
		    <cfset str = reReplaceNoCase(str, "<.*$","")>
		    <cfset str = left(str, 225)>
		    <cfset str = xmlformat(str)>
		</script>
		<cfreturn str>
	</cffunction>
</cfcomponent>