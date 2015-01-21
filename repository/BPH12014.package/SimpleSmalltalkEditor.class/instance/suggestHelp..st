as yet unclassified
suggestHelp: aKeyboardEvent 
	| command menu results tempsAndArgs name2typesDict |
	self selectLine.
	command := self selection asString withBlanksTrimmed.
self halt.
	tempsAndArgs := self parseMethodTempsAndArgs.
	name2typesDict := BPH1ParameterTypeTool availableVarsIn: self model methodName
				on: self model clazz
				withTemps: tempsAndArgs first
				withArgs: tempsAndArgs second.

	results := {'abc'. 'bch'}.

	menu := MenuMorph new.
	menu defaultTarget: self.
	results do: [ :result | menu add: result selector: #resultSelected: argument: result].
	"menu add: 'test' subMenu: MenuMorph example target: self selector: #resultSelected: argumentList: {'test'}."
	menu popUpInWorld.
	^ true