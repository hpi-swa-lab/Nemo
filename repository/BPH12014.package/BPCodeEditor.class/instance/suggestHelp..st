as yet unclassified
suggestHelp: aKeyboardEvent
	| command methods filter |
	command := self selection asString withBlanksTrimmed.

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
			BPMarkovFilter new method: (self model clazz compiledMethodAt: self model methodName asSymbol).}) run.
		methods := (((filter markovChain at: filter variableToken type) at: filter variableName) sortedCounts) asPipe
			"collect: [ :x | x value join: ' ' ];"
			"select: [ :x | (x value size >= 4) and: [x key >= 2] and: [ x value startsWithDigit not] ];"
			collect: [ :x | x value tailSource join: ' '];
			do.
		(filter variableName = 'self') ifTrue: [
			methods := BPMethodModificationBook uniqueInstance suggestMethodsFor: self model clazz.
			self model clazz methodDict keysDo: [ :method | methods add: method ifPresent: []] ].

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

	"sort: [ :a :b | a size < b size ]".
	BPSuggestionListMorph new
		updateMaxItems: 20;
		updateEntries: (methods collectWithIndex: [ :aMethodString :index |
			BPSuggestionEntry new id: index; value: aMethodString.
		]);
		onSelect: [ :aSuggestionEntry |
			self pasteAtCaret: aSuggestionEntry value.
		];
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	^ true