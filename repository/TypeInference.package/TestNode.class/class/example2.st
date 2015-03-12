as yet unclassified
example2
	| a b c |
	a := TestNode new name: #a.
	b := TiSharedVariable new 
			setName: #World;
			seedInitial:  World type.
	c := TestNode new name: #c.
	a connectTo: b.
	a connectTo: c.
	c connectTo: b.
	^ a