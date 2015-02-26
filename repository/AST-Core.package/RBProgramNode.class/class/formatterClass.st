accessing
formatterClass
	^ FormatterClass 
		ifNil: [ RBConfigurableFormatter ] 
		ifNotNil: [ FormatterClass ]