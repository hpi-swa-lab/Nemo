as yet unclassified
addPackage: aString

	(PackageInfo named: aString) methods do: [ :aMethodReference |
		self addMethod: aMethodReference.
	].