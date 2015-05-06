as yet unclassified
variableTestMethod: anArg1 and: anArg2

	| tmpVar1 tmpVar2 |
	tmpVar1 := 1.
	tmpVar2 := 2.
	{} do: [ :item | | blockVar1 blockVar2 |
		blockVar1 := 3.
		blockVar2 := 4.
	].