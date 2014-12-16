accessing
includesAnyPartialMethod
	"Return true, if any behaviour is still left in this layered method."
	
	^ self includesBaseMethod | self partialMethods notEmpty