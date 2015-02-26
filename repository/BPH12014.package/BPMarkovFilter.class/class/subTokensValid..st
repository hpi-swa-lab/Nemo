filtering
subTokensValid: aTokenCollection

	aTokenCollection last type = #cascadeSeparator ifTrue: [ ^ false ].
	aTokenCollection last type = #binary ifTrue: [ ^ false ].
	aTokenCollection last type = #ansiAssignment ifTrue: [ ^ false ].
	^ true.