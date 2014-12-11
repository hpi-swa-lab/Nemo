accessing
contents: aString
	
	contents := aString.
	UIManager default informUser: 'Querying Stackoverflow ...' during: [
		| questions leftText rightText |
		questions := SqueakOverflow questionsFor: aString.
		leftText :=
			('Answered Questions: \ - ',
			(((SqueakOverflow answeredQuestionsFrom: questions) collect: [ :q | q at: 'title' ]) join: '\ - ')) withCRs.
		rightText :=
			('Open Questions: \ - ',
			(((SqueakOverflow openQuestionsFrom: questions) collect: [ :q | q at: 'title' ]) join: '\ - ')) withCRs.
		self
			leftOutput: leftText;
			rightOutput: rightText;
			changed: #contents;
			changed: #leftOutput;
			changed: #rightOutput].