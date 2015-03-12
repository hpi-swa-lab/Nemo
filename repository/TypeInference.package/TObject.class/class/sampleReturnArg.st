examples
sampleReturnArg
	"
	TObject sampleReturnArg
	"
	| aString aNumber |
	aString := #('hello' #bye) at: 1.
	aNumber := #(1 1.0) at: 2.
	aString returnArg: aNumber.
	^ aString 	