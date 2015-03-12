accessing
addInstVar: aRegularVariable
	self debug:[ ' registering new instance variable '].
	self instVars add: aRegularVariable.
	^ aRegularVariable