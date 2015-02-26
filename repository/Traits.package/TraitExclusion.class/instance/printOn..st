composition
printOn: aStream
	"Answer the trait composition string (used for class definitions)"
	aStream nextPutAll: subject asString.
	aStream nextPutAll: ' - {'.
	exclusions asArray sort do:[:exc| aStream store: exc] separatedBy:[aStream nextPutAll: '. '].
	aStream nextPutAll: '}'.