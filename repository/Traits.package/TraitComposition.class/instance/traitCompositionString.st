operations
traitCompositionString
	"Answer the trait composition string (used for class definitions)"
	self size = 0 ifTrue:[^'{}'].
	self  size = 1 ifTrue:[^self first asString].
	^String streamContents:[:s|
		self do:[:each| s nextPutAll: each asString] separatedBy:[s nextPutAll: ' + '].
	].