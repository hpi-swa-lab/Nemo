as yet unclassified
suggestHelp2: aKeyboardEvent
	| command menu results tempsAndArgs name2typesDict commands dictCollection firstCommand types type selectors setters secondCommand thirdCommand classNames remainingClassNames classesContainingThirdCommand setterStrings |
	self selectLine.
	command := self selection asString withBlanksTrimmed.
	tempsAndArgs := self parseMethodTempsAndArgs.
	dictCollection := BPH1ParameterTypeTool availableVarsIn: self model methodName
				on: self model clazz
				withTemps: tempsAndArgs first
				withArgs: tempsAndArgs second.

	name2typesDict := Dictionary new.
	dictCollection do: [ :eaDict | name2typesDict at: (eaDict at: #name) put: (eaDict at: #types) ].

	commands := command substrings.
	firstCommand := commands first.
	secondCommand := commands second.
	thirdCommand := commands third.
	types := name2typesDict at: firstCommand ifAbsent: [].
	type := types asOrderedCollection first.
	selectors := BPClassUtil findMethodSelectorsContaining: secondCommand forClass: type.
	setters := selectors select: [ :selector | selector endsWith: ':' ].
	classNames := BPClassUtil findClassNamesContaining: secondCommand.
	classNames := classNames
		ifEmpty: [ BPClassUtil findClassNamesContainingSubstringsOf: secondCommand ]
		ifNotEmpty: [ classNames ].
	remainingClassNames := BPClassUtil filterClasseNames: classNames understanding: thirdCommand.
	classesContainingThirdCommand := remainingClassNames
		ifEmpty: [ BPClassUtil filterClassesNames: classNames containing: thirdCommand ]
		ifNotEmpty: [].
	results := OrderedCollection new.
	setterStrings := setters collect: [ :setter | firstCommand , ' ' , setter ].
	classesContainingThirdCommand
		ifNil: [
			setterStrings do: [ :s | remainingClassNames
							do: [ :name | results add: s , ' ' , name , ' ' , thirdCommand ] ] ]
		ifNotNil: [
			setterStrings do: [ :s | classesContainingThirdCommand
							do: [ :name | results add: s , ' ' , name , ' new' ] ]	].

	results := results sort: [ :a :b | a size < b size ].
	menu := MenuMorph new.
	menu defaultTarget: self.
	results do: [ :result | menu add: result selector: #resultSelected: argument: result ].
	"menu add: 'test' subMenu: MenuMorph example target: self selector: #resultSelected: argumentList: {'test'}."
	menu popUpInWorld.
	menu position: self positionForPopUp + self morph editView position + (5@1).
	^ true