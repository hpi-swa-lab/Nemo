private-accessing
observedPackages

		observedPackages ifNil: [ self observedPackages: OrderedCollection new. ].
		^ observedPackages