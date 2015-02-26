operations
updateSelector: aSelector withTraitMethod: compiledMethod from: aTrait
	"broadcasts the change of a selector to all users of a trait"
	^self subclassResponsibility