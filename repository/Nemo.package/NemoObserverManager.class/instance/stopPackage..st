private-observation
stopPackage: aString

		(PackageInfo named: aString) methods do: [ :aMethodReference |
				self methodRemoved: aMethodReference.
		]