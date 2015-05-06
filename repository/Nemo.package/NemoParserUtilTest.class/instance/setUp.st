running
setUp
	self sourceCode:
		'myTestMethod: firstArg with: secondArg
			| temp1 temp2 |
			temp1 := 11
			sourceCode := ''abc''
		^ temp1
'