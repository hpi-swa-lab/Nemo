key
forKey: aKey useCategory: aCategory 
	^LogConfigurationHolder instance at:aKey put: (self new useCategory: aCategory)