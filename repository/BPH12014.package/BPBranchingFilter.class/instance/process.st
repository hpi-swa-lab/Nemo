private-processing
process
	"Executes the branches if they want it to do so.
	State is passed around via the internal dictionary of this filter."

	branches do: [ :x | 
		((x at: 1) value: self dictionary) ifTrue: [
			((x at: 2) dictionary: self dictionary) run]].