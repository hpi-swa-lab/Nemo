A BPMarkovFilter is a scanner for source code that builds up a markov chain from the input.

Note that this filter produces an association of the rough type:
Syntax token type (as defined by SHParser) -> token source code string -> list of size N of following token code strings.

Eg: The following code (morph is a variable)
	morph delete.

Should produce (for N = 2)
	#tempVar -> 'morph' -> #('delete' '.')

Note that the list is added to a bag of lists which might occur after morph.
