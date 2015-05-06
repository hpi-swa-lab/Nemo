accessing
removePackage: aString

		self observedPackages remove: aString ifAbsent: [ ^ self ].
		self isStarted ifTrue: [
				self stopPackage: aString.
		].