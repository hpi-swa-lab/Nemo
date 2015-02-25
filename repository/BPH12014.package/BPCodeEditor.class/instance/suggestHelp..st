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
			BPTokenizerFilter new clazz: self model selectedClass; sourceCode: paragraph text asString.
			BPVariableNameAtCaretFilter new caretPosition: self startIndex.
			BPMarkovFilter new methodReference: (MethodReference class: self model selectedClassOrMetaClass selector: self model selectedMessageName).}) run.
		methods := (((filter markovChain at: filter variableToken type ifAbsent: [Dictionary new])
						at: filter variableName ifAbsent: [Bag new]) sortedCounts)
			collect: [ :assoc | | aBPMarkovChainTail |
				aBPMarkovChainTail := assoc value.
				aBPMarkovChainTail count: assoc key.
				aBPMarkovChainTail].
		"(filter variableName = 'self') ifTrue: [
			methods := BPMethodModificationBook uniqueInstance suggestMethodsFor: self model clazz.
			self model clazz methodDict keysDo: [ :method | methods add: method ifPresent: []] ]."

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
		updateEntries: (methods collectWithIndex: [ :aBPMarkovChain :index |
			BPSuggestionEntry new
				id: index;
				value: aBPMarkovChain;
				displayValue: aBPMarkovChain asString.
		]);
		onSelect: [ :aSuggestionEntry |
			self pasteAtCaret: aSuggestionEntry displayValue.
		];
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	^ true