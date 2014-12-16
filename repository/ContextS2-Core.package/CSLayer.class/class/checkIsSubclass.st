private
checkIsSubclass
	
	self == CSLayer ifTrue: [ self error: 'Cannot access singleton-instance of CSLayer itself.' ].