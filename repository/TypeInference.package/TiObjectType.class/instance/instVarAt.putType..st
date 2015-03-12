private
instVarAt: aSymbol putType: aType
	1 to: instVarTypes size 
		do: [:i | (instVarNames at: i) = aSymbol
					ifTrue: [instVarTypes at: i put: aType. ^ self]].
	self error: 'Variable name: ', aSymbol, ' is not a member of ',self  exactClass
