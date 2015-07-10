as yet unclassified
initialize

	| sendButton size |
	super initialize.
	sendButton := SimpleButtonMorph new.
	sendButton label: 'SEND!'.
	sendButton color: Color green dansDarker.
	size := 300@300.
	self extent: size.
	self addMorph: sendButton.
	
"	mintGreen := Color fromString: '#98FB98'.
	sendButton"
	"sendButton := SimpleButtonMorph new.
	sendButton label: 'SEND!'.
	mintGreen := Color fromString: '#98FB98'.
	sendButton color: mintGreen.
	self addMorph: sendButton."