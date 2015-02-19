as yet unclassified
exampleTestMethod3: aName
	^ aName
		ifNil: ['']
		ifNotNil: [(FileDirectory extensionFor: (aName)) asLowercase]