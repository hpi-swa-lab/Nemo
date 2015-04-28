as yet unclassified
textChanged: aString on: aSuggestionMorph
	| lastInterval replacement |
	lastInterval := aSuggestionMorph valueOfProperty: #lastInterval.
	lastInterval ifNil: [ lastInterval := self selectionInterval ].			
	replacement := aString.
	self startIndex > 1 ifTrue: 
		[ (self text at: self startIndex - 1) isSeparator ifFalse: [replacement := ' ' , replacement] ].
	self
		replace: lastInterval
		with: replacement
		and: [].
	"self afterSelectionInsertAndSelect: text."
	aSuggestionMorph setProperty: #lastInterval toValue: self selectionInterval.
	ActiveHand newKeyboardFocus: aSuggestionMorph chainSuggestionListMorph filterMorph textMorph