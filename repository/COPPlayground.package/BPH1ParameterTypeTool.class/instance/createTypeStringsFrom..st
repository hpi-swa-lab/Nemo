as yet unclassified
createTypeStringsFrom: typeInfo

	^typeInfo collect: [ :classes |
		(classes collect: [ :class |
			class asString.
		]) join: '|'.
	]