filtering
leftRightParenthesisDifference: tokens
	| parenthesesDepth rightParens leftParens |
	parenthesesDepth := 0.
	rightParens := #(rightParenthesis rightParenthesis1 rightParenthesis2 rightParenthesis3 rightParenthesis4 rightParenthesis5 rightParenthesis6 rightParenthesis7 rightBrace blockEnd blockEnd1 blockEnd2 blockEnd3 blockEnd4 blockEnd5 blockEnd6 blockEnd7) asSet.
	leftParens := #(blockStart blockStart1 blockStart2 blockStart3 blockStart4 blockStart5 blockStart6 blockStart7 leftBrace leftParenthesis leftParenthesis1 leftParenthesis2 leftParenthesis3 leftParenthesis4 leftParenthesis5 leftParenthesis6 leftParenthesis7) asSet.

	tokens doWithIndex: [ :token :index |
		(rightParens includes: token type)
			ifTrue: [ parenthesesDepth > 0
				ifTrue: [ parenthesesDepth := parenthesesDepth - 1 ]
				ifFalse: [ ^ -1 ] ].
		(leftParens includes: token type)
			ifTrue: [ parenthesesDepth := parenthesesDepth + 1 ]].
	^ parenthesesDepth