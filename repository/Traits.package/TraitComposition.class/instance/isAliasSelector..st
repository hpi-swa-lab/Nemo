operations
isAliasSelector: selector
	"enumerates all selectors and methods in a trait composition"
	^self anySatisfy:[:any| any isAliasSelector: selector]