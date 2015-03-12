auxiliars
addStringIfNotPressentOnNotEmpty
	| instance | 
	instance := self instantiation.
	instance add: 'aString'.
	^instance addIfNotPresent: 'aString'.
	
	