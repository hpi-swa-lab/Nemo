as yet unclassified
contents: input notifying: aController 
	| aText |
	aText := input asText.
	^ self compileMessage: aText notifying: aController