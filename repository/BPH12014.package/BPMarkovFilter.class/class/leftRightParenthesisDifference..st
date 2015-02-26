filtering
leftRightParenthesisDifference: tokens

"Detects useful token sequences, by counting if all opening paranthesis are closed etc."

	| parenthesesDepth |
	parenthesesDepth := 0.

	tokens doWithIndex: [ :token :index |
		(RightParenthesis includes: token type)
			ifTrue: [ parenthesesDepth > 0
				ifTrue: [ parenthesesDepth := parenthesesDepth - 1 ]
				ifFalse: [ ^ -1 ] ].
		(LeftParenthesis includes: token type)
			ifTrue: [ parenthesesDepth := parenthesesDepth + 1 ]].
	^ parenthesesDepth