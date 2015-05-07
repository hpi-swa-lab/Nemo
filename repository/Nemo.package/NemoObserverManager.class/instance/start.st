accessing
start

		self isStarted: true.
		self observedPackages
			do: [ :packageName | self startPackage: packageName. ]
			displayingProgress: [ :packageName | 'Processing package: ' , packageName ].