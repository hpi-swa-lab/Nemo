auxiliars
addAll: somethings
	| instance | 
	instance := self instantiation.
	instance := instance, somethings.
	^instance.
	