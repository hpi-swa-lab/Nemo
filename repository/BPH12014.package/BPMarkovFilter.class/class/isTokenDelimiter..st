markov
isTokenDelimiter: anSHRange

	^ #(
		blockPatternTempVar blockTempBar methodTempBar
		statementSeparator
		#blockArgsBar #blockEnd #blockEnd1 #blockEnd2 #blockEnd3 #blockEnd4 #blockEnd5 #blockEnd6 #blockEnd7 #blockPatternArg 		#blockPatternTempVar #blockStart #blockStart1 #blockStart2 #blockStart3 #blockStart4 #blockStart5 #blockStart6 #blockStart7 #blockTempBar 		#blockTempVar
	) asSet includes: anSHRange type.