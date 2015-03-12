as yet unclassified
buildFor: elements using: aContextBuilder 
	| instance | 
	instance  := self new.
	instance elements: elements.
	instance using: aContextBuilder .
	^instance build.