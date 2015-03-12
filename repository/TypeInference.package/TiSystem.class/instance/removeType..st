type memory
removeType: aType
	self debugSender.
	^ typeMemory remove: aType ifAbsent: [ nil ].