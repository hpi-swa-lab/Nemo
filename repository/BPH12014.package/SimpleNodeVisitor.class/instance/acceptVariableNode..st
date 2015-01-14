as yet unclassified
acceptVariableNode: aVariableNode
"TODO: auch kleiner gleich pruefen sonst wird immer einer gesetzt"
	"((aVariableNode start > (self caretPosition - 1)) and: [self enclosingNode isNil]) ifTrue: [self enclosingNode: self lastAcceptedNode].
	self lastAcceptedNode: aVariableNode"