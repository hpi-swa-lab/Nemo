*TypeInference
mirrorIn: contextBuilder 
	"true false and nil should be LiteralNode. see  DecompilerConstructor codeConstants "
	| symbolName |
	
	"True"
	self == NodeTrue ifTrue: [
		^ contextBuilder buildLiteral: true
	].
	"False"
	self == NodeFalse 	ifTrue: [
		^ contextBuilder buildLiteral: false
	].
	"Nil"
	self == NodeNil ifTrue: [
		^ contextBuilder buildLiteral: nil
	].
	
	symbolName := name asSymbol.
	contextBuilder debug:[ 'variable symbolName: ', symbolName ,' me:',  self asString ].
	"#self"	
	symbolName = #self  ifTrue: [^ contextBuilder nodeSelf].
	"#super"	
	symbolName = #super	ifTrue: [^ contextBuilder nodeSuper].
	"#thisContext"	
	symbolName = #thisContext ifTrue:[ ^ contextBuilder thisContextVariable. ].
	"Instance Variable"	
	self isInstanceVariable 	ifTrue: [^ contextBuilder instanceVariable: symbolName].
	"Argument"	
	self isArg ifTrue: [^ contextBuilder argumentVariable: symbolName].
	"Global Variable"	
	self isSharedVarNode ifTrue: [^ contextBuilder sharedVariableAt: key value named: symbolName].
	"Local Variable"	
	^ contextBuilder localVariable: symbolName