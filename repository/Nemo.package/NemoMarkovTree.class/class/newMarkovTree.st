public
newMarkovTree
	"Creates a new markov tree."
	
	^Dictionary new
		at: #'$selector' put: #'$root';
		at: #'$count' put: 0;
		yourself.