initialization
run
	[self challenge.
	self confirm: 'Do you want to continue?'] whileTrue.
	self inform: 'Thanks for your participation!!!, Your score is ' , self score printString