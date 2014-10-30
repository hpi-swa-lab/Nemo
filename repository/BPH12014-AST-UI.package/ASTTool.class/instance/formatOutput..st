actions
formatOutput: aPairCollection
	| output |
	output := ''.	
	aPairCollection do: [ :eaEntry |
		output := output , eaEntry first , ' -> ' , eaEntry second , Character cr
	].
	^ output