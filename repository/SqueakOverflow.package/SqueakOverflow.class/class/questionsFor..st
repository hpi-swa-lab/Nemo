utilities
questionsFor: aString
	"Do a feeling-lucky search on StackOverflow for tag smalltalk and the given term. Return text of the first answer."

	| json |
	
	json := self jsonFor: (self searchUrlFor: aString).
	
	^(json at: 'items').