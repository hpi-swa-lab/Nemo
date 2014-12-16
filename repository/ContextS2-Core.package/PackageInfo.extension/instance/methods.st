*contexts2-core-override-listing
methods
	^ ((
	"-- START COPIED CODE --"
	(self extensionMethods, self coreMethods) select: [:method |
		method isValid
			and: [method isLocalSelector
			and: [method methodSymbol isDoIt not]]]
	"-- END COPIED CODE --"
	) select: [:method || compiledMethod |
		compiledMethod := method compiledMethod.
		compiledMethod isCompiledMethod or: [
		compiledMethod  isContextSMethod and: [compiledMethod hasBaseMethod]]]),
	self layeredMethods