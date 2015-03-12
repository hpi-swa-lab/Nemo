key
forKey: aKey useLevel: aLevel  into:aWriter 
	^LogConfigurationHolder instance at:aKey put: (self new useLevel: aLevel  into:aWriter  )