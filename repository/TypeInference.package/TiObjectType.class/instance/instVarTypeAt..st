accessing
instVarTypeAt: aSymbol
	instVarTypes isNil ifTrue: [
		self mutate.
	].
	1 to: instVarTypes size 
		do: [:i | (instVarNames at: i) = aSymbol
					ifTrue: [^ instVarTypes at: i]].
	self error: 'Variable name: ', aSymbol, ' is not a member of ', self exactClass name
