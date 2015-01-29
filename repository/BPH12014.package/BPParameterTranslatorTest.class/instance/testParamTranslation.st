as yet unclassified
testParamTranslation
	| aFilter expectedResultDict |
	filter dictionary at: #abc put: 1.
	filter dictionary at: #a put: 2.
	filter dictionary at: #other put: 3.

	aFilter := filter parameterTranslations: (Dictionary newFrom: {#abc -> #efg. #a -> #b});
		run.

	expectedResultDict := Dictionary newFrom: {#abc -> 1. #a -> 2. #other -> 3. #efg -> 1. #b -> 2}.
	self assert: expectedResultDict equals: aFilter dictionary