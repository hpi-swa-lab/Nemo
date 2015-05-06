private-observation
startPackage: aString

		(PackageInfo named: aString) methods do: [ :aMethodReference |
				self methodAdded: aMethodReference.
		]