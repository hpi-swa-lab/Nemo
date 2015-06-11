window color
windowColorSpecification
	"Answer a WindowColorSpec object that declares my preference"

	^ WindowColorSpec
		classSymbol: self name
		wording: 'Nemo Debugger'
		brightColor: #lightOrange
		pastelColor: #paleOrange
		normalColor: (Color r: 0.777 g: 0.329 b: 0.053) "(Color r: 0.525 g: 0.688 b: 0.449)"
		helpMessage: 'A cooler system debugger.'