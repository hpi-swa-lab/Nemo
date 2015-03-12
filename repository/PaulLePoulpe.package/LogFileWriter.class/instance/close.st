accessing
close
	self stream ifNil: [ ^ self ].
	self stream closed not ifTrue: [
		stream close. 	
	].
	stream := nil.