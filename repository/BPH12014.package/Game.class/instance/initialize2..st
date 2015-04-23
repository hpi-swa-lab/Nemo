initialize-release
initialize2: aNumber "aNumber := 42"
	| var1 var2 var3 |
	morph := Morph new.
	var1 := {3. 4}.
	var2 := var1 collect: [ :a | a + aNumber ].
	var3 := var1
				collect: [ :a | a + aNumber ];
				asOrderedCollection;
				asString.
	^ var2