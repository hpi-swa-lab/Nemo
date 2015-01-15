initialize-release
initialize2: aNumber
	| var1 var2 |
	morph := Morph new.
	var1 := {3. 4}.
	var2 := var1 collect: [ :a | a + aNumber ].
	^ var2