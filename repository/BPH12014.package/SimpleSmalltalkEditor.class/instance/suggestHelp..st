as yet unclassified
suggestHelp: aKeyboardEvent 
	| command menu results methods filter |
	command := self selection asString withBlanksTrimmed.
	self halt.
	"methods := (BPFilter pipeline: {
			BPTokenizerFilter new clazz: self model clazz; sourceCode: paragraph text asString.
			BPVariableNameAtCaretFilter new caretPosition: self startIndex.
			BPVariableNameToGuessedTypeBookFilter new method: self model methodName.
			BPVariableNameToTypeFilter new.
			BPMethodsOnClassFilter new
		}) run methods."
	"self selectLine."
	"methods := (BPFilter pipeline: {
			BPLineToCommandsFilter new inputLine: self selection asString.
			BPCommandsToVariableNameFilter new.
			BPVariableNameToGuessedTypeBookFilter new clazz: self model clazz; method: self model methodName.
			BPVariableNameToTypeFilter new.
			BPCommandsToSelectorSubStringFilter new.
			BPTypeAndSelectorSubstringToSelectorsFilter new.
			BPSelectorsToSetterSelectorsFilter new.
			BPCommandsToClassNameSubStringFilter new.
			BPClassNameSubstringToClassesFilter new.
			BPCommandsToMethodSelectorFilter new.
			BPClassNamesAndSelectorToUnderstandingClassesFilter new.
			BPOutputFormattingFilter new.
		}) run results."

		filter := (BPFilter pipeline: {
			BPTokenizerFilter new clazz: self model clazz; sourceCode: paragraph text asString.
			BPVariableNameAtCaretFilter new caretPosition: self startIndex.
			BPMarkovFilter new.}) run.
		methods := (filter sourceToSource at: filter variableName) sortedCounts
			select: [ :x | x value size >= 4 ]
			thenCollect: [ :x | x value ].

	"methods := (BPFilter pipeline: {
			BPLineToCommandsFilter new inputLine: self selection asString.
			BPCommandsToVariableNameFilter new.
			BPParameterTranslator new parameterTranslations: (Dictionary newFrom: {#variableName -> #classNameSubstring}).
			BPClassNameSubstringToClassesFilter new.
		}) run classNames.

	clazzAndMethods := OrderedCollection new.
	methods do: [:clazz |
		(Smalltalk at: clazz) methodsDo: [:m |
			((m getSource asString asLowercase includesSubString: 'read')
				and: [m getSource asString asLowercase includesSubString: 'all']
				and: [m getSource asString asLowercase includesSubString: 'contents'])
			ifTrue: [clazzAndMethods add: (clazz , '>>', m selector asString)]]].
	methods := clazzAndMethods."

	results := methods "sort: [ :a :b | a size < b size ]".
	menu := MenuMorph new.
	menu defaultTarget: self.
	results do: [ :result | menu add: result selector: #resultSelected: argument: result ].
	"menu add: 'test' subMenu: MenuMorph example target: self selector: #resultSelected: argumentList: {'test'}."
	menu popUpInWorld.
	menu position: self positionForPopUp + self morph editView position + (5@1).
	^ true