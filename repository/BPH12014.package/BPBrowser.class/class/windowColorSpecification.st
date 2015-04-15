as yet unclassified
windowColorSpecification
	"Answer a WindowColorSpec object that declares my preference"

	^ WindowColorSpec
		classSymbol: self name
		wording: 'Suggestion Browser'
		brightColor: #lightRed
		pastelColor: #paleRed
		normalColor: (Color r: 1.0 g: 0.424 b: 0.424)
		helpMessage: 'A cooler system browser.'