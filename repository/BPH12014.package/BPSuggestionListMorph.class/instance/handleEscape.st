initialization
handleEscape

	self onEscape ifNotNilDo: [ :onEscapeBlock | onEscapeBlock value. ].