accessing
contents: aString
	
	contents := aString.
	UIManager default informUser: 'Analyzing methods ...' during: [
		| leftText rightText |
		leftText := self createMethodDefinitionsOutput: self contents.
		rightText := self createLiteralsOutput: self contents.
		self
			leftOutput: leftText;
			rightOutput: rightText;
			changed: #contents;
			changed: #leftOutput;
			changed: #rightOutput
	].