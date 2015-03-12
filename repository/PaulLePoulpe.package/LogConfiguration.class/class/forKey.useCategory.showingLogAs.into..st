key
forKey: aKey useCategory: aCategory  showingLogAs: aFormatter into:aWriter 
	^LogConfigurationHolder instance at:aKey put: (self new useCategory: aCategory  showingLogAs: aFormatter into:aWriter )