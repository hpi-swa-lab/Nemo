private
increaseOccurrences: aDictionary
	"Access the special selector #&count of the given markov tree dictionary and increase its value."
	
	aDictionary at: #'$count' put: ((aDictionary at: #'$count' ifAbsentPut: [ 0 ]) + 1)