key
forKey: aKey useCategory: aCategory into:aWriter 
	^LogConfigurationHolder instance at:aKey put: (self new useCategory: aCategory into:aWriter)