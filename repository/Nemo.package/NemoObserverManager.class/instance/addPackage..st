accessing
addPackage: aString

		self observedPackages add: aString.
		self isStarted ifTrue: [
				self startPackage: aString.
		].