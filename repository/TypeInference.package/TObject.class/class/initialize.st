initialization
initialize
	" 
	TObject initialize 
	"
	Smalltalk globals at:#RandomBoolean put: true.
	Smalltalk globals at:#SharedTObject put: TObject new.