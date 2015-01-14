as yet unclassified
guessIt: aKeyboardEvent	
	| command menu results |
	self selectLine.
	command := self selection asString withBlanksTrimmed.
	
	results := self findMessagesAndFormatResult: command.

	menu := MenuMorph new.
	menu defaultTarget: self.
	results do: [ :result | menu add: result selector: #resultSelected: argument: result].
	"menu add: 'test' subMenu: MenuMorph example target: self selector: #resultSelected: argumentList: {'test'}."
	menu popUpInWorld.

	^ true