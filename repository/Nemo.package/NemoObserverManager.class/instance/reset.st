accessing
reset

		self stop.
		self observers do: [ :anObserver | anObserver reset. ].
		
		self observedPackages reset.
		self observers reset.