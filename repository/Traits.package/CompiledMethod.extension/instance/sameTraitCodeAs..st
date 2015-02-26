*Traits-NanoKernel
sameTraitCodeAs: method
	"Answer whether the receiver implements the same code as the 
	argument, method. Does not look at properties/pragmas since they
	do not affect the resulting code."
	| numLits |
	(method isKindOf: CompiledMethod) ifFalse: [^false].
	self methodHome == method methodHome ifFalse:[^false].
	(self properties analogousCodeTo: method properties) ifFalse:[^false].
	self size = method size ifFalse: [^false].
	self header = method header ifFalse: [^false].
	self initialPC to: self endPC do:[:i | (self at: i) = (method at: i) ifFalse: [^false]].
	(numLits := self numLiterals) ~= method numLiterals ifTrue: [^false].
	1 to: numLits-2 do:[:i| | lit1 lit2 |
		lit1 := self literalAt: i.
		lit2 := method literalAt: i.
		(lit1 == lit2 or: [lit1 literalEqual: lit2]) ifFalse: [
			(i = 1 and: [#(117 120) includes: self primitive]) ifTrue: [
				lit1 isArray ifTrue:[
					(lit2 isArray and: [lit1 allButLast = lit2 allButLast]) ifFalse:[^false]
				] ifFalse: "ExternalLibraryFunction"
					[(lit1 analogousCodeTo: lit2) ifFalse:[^false]].
			] ifFalse:[
				"any other discrepancy is a failure"^ false]]].
	^true