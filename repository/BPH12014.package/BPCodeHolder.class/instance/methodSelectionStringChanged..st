toolbuilder
methodSelectionStringChanged: aString
	| splits |
	self contents: nil.
	splits := (aString asString withBlanksTrimmed splitBy: ' ').
	
	self methodName: splits second asString asSymbol.
	self clazz: (Smalltalk at: splits first asString asSymbol ifAbsent:[]).
	self contentsChanged.