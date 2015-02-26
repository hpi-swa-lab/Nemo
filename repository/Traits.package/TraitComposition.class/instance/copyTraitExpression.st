operations
copyTraitExpression
	"Copy all except the actual traits"
	^self collect:[:each| each copyTraitExpression].