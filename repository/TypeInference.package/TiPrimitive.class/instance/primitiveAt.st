object access primitives
primitiveAt
	| result |

	arguments size = 1 ifFalse: [^ nil].
	(arguments first exactClass inheritsFrom: Integer) ifFalse: [^ nil].
	
	result := self createResult.
	receiver indexedVarTypesDo:[:each |
		result addReturn: each].
	^result