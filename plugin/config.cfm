<cfscript>
	if(not isDefined("$")){
		$ = application.serviceFactory.getBean('muraScope').init('default');
	}
	if (not(isDefined("pluginConfig"))){
		pluginConfig = $.getBean('pluginManager').getConfig('TwitterCards');
	}
</cfscript>