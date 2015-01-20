After the MethodFinder fails to find an expression, call MethodFinder2 to search for an additional method that will give the right answer.
	MethodFinder methodFor: #( (2 2 ) '4'  (3 3) '6'  (5 5) '10' ).
	fails with (data1 + data2), but now look for ((data1 + data2) asString)
Only ask for one solution, to speed things up.