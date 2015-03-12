constructors
with:aBlock 
	| i |
	i := self basicNew.
	^i block:aBlock; yourself .