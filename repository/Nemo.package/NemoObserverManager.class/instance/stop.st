accessing
stop

		self isStarted: false.
		self observedPackages do: [ :packageName | self stopPackage: packageName. ].