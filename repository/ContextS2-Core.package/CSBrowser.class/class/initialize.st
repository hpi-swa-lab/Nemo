class initialization
initialize
	| menu |
	super initialize.
	menu := (Smalltalk at: #TheWorldMenu ifAbsent: [^ self]).
	(menu respondsTo: #registerOpenCommand:) ifTrue: [
		menu registerOpenCommand: {'ContextS Browser'. {self. #open}}].