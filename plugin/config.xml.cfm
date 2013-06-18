<cfoutput>
<plugin>
	<name>Twitter Cards</name>
	<package>TwitterCards</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>1.0</version>
	<provider>Peter Bowater</provider>
	<providerURL>http://www.binaryvision.com</providerURL>
	<category>Application</category>
	<settings>
	</settings>
	<displayObjects>
	</displayObjects>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="eventHandlers.twitterCards" persist="true"/>
	</eventHandlers>
	<extensions>
		<extension type="Site">
			<attributeset name="Twitter Cards settings">
				<attribute 
					name="twitterHandle" 
					label="Twitter account name" 
					hint="Enter the site/organisation twitter username including the @" 
					type="Text"
					defaultValue="@muracms"
					required="false"
					validation="None"
					regex=""
					message="" 
					optionList=""
					optionLabelList=""/>			
				<attribute 
					name="twitterDefaultDescription" 
					label="Default card description" 
					hint="Where there is no Summary or Body text, this is used as the 'description' value for the Twitter Card, which is a required field."
					type="Text"
					defaultValue="Read more on our site"
					required="false"
					validation="None"
					regex=""
					message="" 
					optionList=""
					optionLabelList=""/>	
			</attributeset>		
		</extension>
	</extensions>				
</plugin>


</cfoutput>