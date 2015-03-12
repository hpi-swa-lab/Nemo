tests
testBlockForWithSelector
	"Obsolete"
	| object result announcer |
	announcer := Announcer new.
	object := 'The best test.'.
	result := announcer subscriptionRegistry subscriptionClass blockFor: object withSelector: #size.
	self assert: result isBlock.
	self assert: result numArgs = 0.
	self assert: result value = object size.
	result := announcer subscriptionRegistry subscriptionClass blockFor: object withSelector: #findString:.
	self assert: (result value: 'est') = (object findString: 'est').
	self assert: result isBlock.
	self assert: result numArgs = 1.
	result := announcer subscriptionRegistry subscriptionClass blockFor: object withSelector: #findString:startingAt:.
	self assert: result isBlock.
	self assert: result numArgs = 2.
	self assert: (result value: 'est' value: 8) = (object findString: 'est' startingAt: 8).
	
	