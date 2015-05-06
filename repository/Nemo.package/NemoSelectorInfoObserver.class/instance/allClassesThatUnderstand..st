as yet unclassified
allClassesThatUnderstand: selector

	^ self selectorUnderstandings at: selector ifAbsentPut: [
			| allClassesThatUnderstandSelector |
			allClassesThatUnderstandSelector :=
				(SystemNavigation default allClassesImplementing: selector) asSet.
			allClassesThatUnderstandSelector copy do: [ :implementor |
				allClassesThatUnderstandSelector addAll: implementor allSubclasses.
			].
			allClassesThatUnderstandSelector.
		]
