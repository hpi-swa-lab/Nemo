as yet unclassified
suggestHelp: aKeyboardEvent 
	| command menu results methods |
	command := self selection asString withBlanksTrimmed.

	methods := (BPFilter pipeline: {
			BPTokenizerFilter new clazz: self model clazz; sourceCode: paragraph text asString.
			BPVariableNameAtCaretFilter new caretPosition: self startIndex.
			BPVariableNameToGuessedTypeFilter new method: self model methodName.
			BPVariableNameToTypeFilter new.
			BPMethodsOnClassFilter new
		}) run methods.

	results := methods sort: [ :a :b | a size < b size ].
	menu := MenuMorph new.
	menu defaultTarget: self.
	results do: [ :result | menu add: result selector: #resultSelected: argument: result ].
	"menu add: 'test' subMenu: MenuMorph example target: self selector: #resultSelected: argumentList: {'test'}."
	menu popUpInWorld.
	menu position: self positionForPopUp + self morph editView position + (5@1).
	^ true