operations
isLocalAliasSelector: selector
	"Return true if the selector aSymbol is an alias defined in the receiver."
	^self anySatisfy:[:any| any isTraitTransformation and:[any isLocalAliasSelector: selector]]