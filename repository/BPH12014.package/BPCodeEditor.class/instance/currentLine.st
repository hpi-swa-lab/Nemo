as yet unclassified
currentLine
	| textLine |
	textLine := self paragraph lines at: (self paragraph lineIndexOfCharacterIndex: self pointIndex).
	^ (self string copyFrom: textLine first to: textLine last) withBlanksTrimmed