messages
testMessage
	| t1 t2 |
	self returnParameter: 7.
	t1 := #hello.
	t2 := self.
	^ t2 returnParameter: t1