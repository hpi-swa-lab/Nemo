accessing
open
	| fileStream |
	self close .
	fileStream := FileStream fileNamed: self path.
	fileStream setToEnd.
	self stream: fileStream.
	