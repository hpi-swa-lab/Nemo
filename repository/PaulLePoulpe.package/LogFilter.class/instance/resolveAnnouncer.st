announcement
resolveAnnouncer

	self announcer ifNil: [
		self announcer: Announcer new.	
		"self announcer weak."
	].
	^ self announcer.