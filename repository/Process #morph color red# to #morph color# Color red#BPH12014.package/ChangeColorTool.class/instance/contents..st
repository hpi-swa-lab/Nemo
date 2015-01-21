accessing
contents: aString
	
	contents := aString.
	UIManager default informUser: 'Analyzing methods ...' during: [
		| outputText |
		outputText := self createRecommendationOutput: self contents.
		self
			output: outputText;
			changed: #contents;
			changed: #output
	].