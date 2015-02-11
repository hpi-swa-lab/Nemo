as yet unclassified
selectFrom: a to: b

"	self halt."
"	(thisContext stack anySatisfy: [:ctxt | ctxt method selector = #pasteAtCaret:])
		ifTrue: [self halt].
"
"	Smalltalk at: #foo put: OrderedCollection new."
	"(Smalltalk at: #foo) add: thisContext stack."
	^ super selectFrom: a to: b.