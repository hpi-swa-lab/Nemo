constructor
new:writtersArray
 |i | 
 i := self new.

	writtersArray do: [ :writter | 
		i addWriter: writter.
	].
^i.


