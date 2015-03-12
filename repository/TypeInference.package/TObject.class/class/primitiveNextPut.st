primitives
primitiveNextPut
	"
	TObject new primitiveNextPut
	"
	| stream |
	stream := WriteStream on: String new.
	^ stream 
		nextPut: $a;
		nextPut: $b
		; yourself