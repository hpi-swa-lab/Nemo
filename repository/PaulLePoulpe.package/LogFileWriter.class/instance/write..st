write
write: aString
	self stream nextPutAll: aString.
	self stream nextPut: Character cr.
	self stream lf.
	