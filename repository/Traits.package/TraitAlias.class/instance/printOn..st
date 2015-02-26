operations
printOn: s
	"Answer the trait composition string (used for class definitions)"
	s nextPutAll: subject asString.
	s nextPutAll: ' @ {'.
	aliases do:[:assoc| s print: assoc] separatedBy:[s nextPutAll:'. '].
	s nextPutAll: '}'.
