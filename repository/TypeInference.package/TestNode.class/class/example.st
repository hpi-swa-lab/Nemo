as yet unclassified
example
	| a b c |
	a := TestNode new name: #a.
	b := TestNode new name: #b.
	c := TestNode new name: #c.
	a connectTo: b.
	a connectTo: c.
	b connectTo: c.
	c connectTo: a.
	^ a