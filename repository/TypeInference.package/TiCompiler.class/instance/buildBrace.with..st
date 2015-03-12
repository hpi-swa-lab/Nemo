nodes
buildBrace: elements with: aContextBuilder 
	"Note that this is a simplification over the original implementation in BraceNode
	which optimizes for sizes of element collection less than 4"
	"Long form: (Array braceStream: N) nextPut: a; nextPut: b; ...; braceArray"
	self assertContext: aContextBuilder.
	
	^BracedArrayCascadeNodeBuilder buildFor: elements using: aContextBuilder .
	