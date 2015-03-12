blocks fundamentals
blockWithManyArguments
	"TObject new blockWithManyArguments"
	^ [:t1 :t2 :t3 :t4 :t5 | t1. t2. t3. t4. t5]
		valueWithArguments: #($a #symbol 3 4 5.0)
