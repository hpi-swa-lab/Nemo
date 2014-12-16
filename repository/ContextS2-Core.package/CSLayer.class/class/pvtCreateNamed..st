private
pvtCreateNamed: aSymbol
	"Only internal, for controlled instance creation."
	
	^ self basicNew initialize: aSymbol; yourself