filtering
validToken: aToken
"possible tokens:
#'$' #- #ansiAssignment #arrayEnd #arrayStart #assignment #binary #blockArg #blockArgColon #blockArgsBar #blockEnd #blockEnd1 #blockEnd2 #blockEnd3 #blockEnd4 #blockEnd5 #blockEnd6 #blockEnd7 #blockPatternArg #blockPatternTempVar #blockStart #blockStart1 #blockStart2 #blockStart3 #blockStart4 #blockStart5 #blockStart6 #blockStart7 #blockTempBar #blockTempVar #byteArrayEnd #byteArrayStart #cascadeSeparator #character #classVar #comment #excessCode #false #globalVar #incompleteUnary #instVar #integer #keyword #leftBrace #leftParenthesis #leftParenthesis1 #leftParenthesis2 #leftParenthesis3 #leftParenthesis4 #leftParenthesis5 #leftParenthesis6 #leftParenthesis7 #methodArg #methodTempBar #module #nil #number #patternArg #patternKeyword #patternTempVar #poolConstant #pragmaKeyword #pragmaUnary #primitive #primitiveOrExternalCallEnd #primitiveOrExternalCallStart #return #rightBrace #rightParenthesis #rightParenthesis1 #rightParenthesis2 #rightParenthesis3 #rightParenthesis4 #rightParenthesis5 #rightParenthesis6 #rightParenthesis7 #self #statementSeparator #string #stringSymbol #super #symbol #tempVar #thisContext #true #unary #undefinedIdentifier"
^ true.
	"| type |
	type := aToken type.
	^ ((((((type == #unary)
		or: [type == #assignment]
		or: [type == #binary]
		or: [type == #blockArg]
		or: [type == #blockPatternArg]
		or: [type == #blockPatternTempVar])
			or: [type == #blockTempVar]
			or: [type == #character]
			or: [type == #classVar]
			or: [type == #false]
			or: [type == #globalVar])
				or: [type == #instVar]
				or: [type == #methodArg]
				or: [type == #integer]
				or: [type == #keyword]
				or: [type == #incompleteUnary])
					or: [type == #nil]
					or: [type == #number]
					or: [type == #patternArg]
					or: [type == #patternKeyword]
					or: [type == #patternTempVar])
						or: [type == #self]
						or: [type == #stringSymbol]
						or: [type == #super]
						or: [type == #symbol]
						or: [type == #thisContext])
							or: [type == #tempVar]
							or: [type == #true]
							or: [type == #ansiAssignment]
							or: [type == #undefinedIdentifier]"