*Nemo-Util
join: delimiter
	"Expects self to be collection of strings and delimiter to be a string.
	returns the concatenation of the elements separated by the delimiter."

	| stream |
	stream := WriteStream with: String new.
	self
		do: [: elem | stream nextPutAll: elem asString]
		separatedBy: [ stream nextPutAll: delimiter asString].
	^ stream contents