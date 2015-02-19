as yet unclassified
exampleTestMethod2

	| a b |
	a := 123.
	b := 456.
	{ 4. 5} ifNotNilDo: [ :var | | another |
		another := 'abc'.
		another asString, var.].
	^ a + b