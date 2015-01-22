as yet unclassified
testMethodsOnClass

	| methods |
	methods := filter clazz: BPExampleClass; run; methods.
	self assert: 1 equals: methods size.
	self assert: #method: equals: methods first