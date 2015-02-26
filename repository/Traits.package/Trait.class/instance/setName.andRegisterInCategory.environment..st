initialize
setName: aSymbol andRegisterInCategory: categorySymbol environment: aSystemDictionary
	(self isValidTraitName: aSymbol) ifFalse: [self error:'Invalid trait name'].

	(self environment == aSystemDictionary
		and: [self name = aSymbol
			and: [self category = categorySymbol]]) ifTrue: [^self].
		
	((aSystemDictionary includesKey: aSymbol) and: [(aSystemDictionary at: aSymbol) ~~ self])
		ifTrue: [self error: 'The name ''' , aSymbol , ''' is already used'].

	(self environment notNil and: [self name notNil and: [self name ~= aSymbol]]) ifTrue: [
		self environment renameClass: self as: aSymbol].
	
	self name: aSymbol.
	self environment: aSystemDictionary.	
	[self environment at: self name put: self]
		on: AttemptToWriteReadOnlyGlobal
		do: [:n | n resume: true].
	self environment organization classify: self name under: categorySymbol.
	^ true