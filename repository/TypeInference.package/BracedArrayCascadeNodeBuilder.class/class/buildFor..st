as yet unclassified
buildFor: elements
	| instance | 
	instance  := self new.
	instance elements: elements.
	^instance build.