as yet unclassified
testFilter01

	| variableTypes methodReferences result |
	variableTypes := {
		'mintGreen' -> Color.
		'abc' -> Morph }.
	methodReferences := {
		MethodReference class: self class selector: #methodWithColorParam:.
		MethodReference class: self class selector: #methodWithMorphParam:. }.
	
	result := NemoTypeFilteringUtil filterMethods: methodReferences matchingTypes: variableTypes.
	
	self assert: result includes: (
		MethodReference class: self class selector: #methodWithColorParam: "-> 'mintGreen'")