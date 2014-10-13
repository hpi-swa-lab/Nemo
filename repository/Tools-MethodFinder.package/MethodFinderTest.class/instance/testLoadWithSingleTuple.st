test cases
testLoadWithSingleTuple

	self methodFinder load: #( (4 3) 7 ).
	self assert: (self methodFinder data = #(#(4 3)) ).
	self assert: (self methodFinder answers = #(7)).