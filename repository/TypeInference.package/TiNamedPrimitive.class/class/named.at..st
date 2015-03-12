as yet unclassified
named: aPrimitiveSelector at: aModule
	| instance |
	instance :=  self new.
	instance selector: aPrimitiveSelector asSymbol .
	^instance.
		
