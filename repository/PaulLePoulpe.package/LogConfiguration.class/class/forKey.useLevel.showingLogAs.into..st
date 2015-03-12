key
forKey: aKey useLevel: aLevel showingLogAs: aFormatter into:aWriter 
	^LogConfigurationHolder instance at:aKey put: (self new useLevel: aLevel showingLogAs: aFormatter into:aWriter )