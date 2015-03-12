*TypeInference
classImplementingSelector: selector 
	"Idem as Behavior|#lookupSelector: but answer the class."
	| lookupClass |
	lookupClass := self.
	[lookupClass == nil]
		whileFalse: 
			[(lookupClass includesSelector: selector)
				ifTrue: [^ lookupClass].
			lookupClass := lookupClass superclass].
	^ nil