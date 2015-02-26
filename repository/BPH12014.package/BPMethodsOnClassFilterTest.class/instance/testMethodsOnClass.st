as yet unclassified
testMethodsOnClass

	| methods |
	methods := filter variableType: BPExampleClass; run; methods.
	self assert: 2 equals: methods size.
	self assert: #method: equals: methods last