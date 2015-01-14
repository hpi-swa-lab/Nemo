as yet unclassified
openMethodFinder: aKeyboardEvent	
	| command browser |
	command := self currentLine.
	browser := SelectorBrowser new open.
	browser model contents: command notifying: nil.
	browser model changed: #contents.
	^ true