test cases
testArgumentPermutation

	| expectedPermutations |
	expectedPermutations := #(
		(1 2 3)
		(1 3 2)
		(2 1 3)
		(2 3 1)
		(3 1 2)
		(3 2 1)
	).

	self methodFinder
		load: #( #( 12 6 3 ) 21);
		generatePermutationsOfInputArguments.

	self assert: (self methodFinder mapList size = 6).
	
	expectedPermutations do: [:perm |
		self assert: (self methodFinder mapList anySatisfy: [ :value |
			value = perm
		]).
	].