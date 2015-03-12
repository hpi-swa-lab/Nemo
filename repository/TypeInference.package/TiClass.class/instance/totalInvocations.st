inquires
totalInvocations
	^ methodDict inject: 0 into: [:acum :analyzedMethod | acum + analyzedMethod invocations size]