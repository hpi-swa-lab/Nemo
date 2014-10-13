test cases
testLoadWithMultipleTuples

	self methodFinder load: #( (4 3) 7 (5 9) 14 ).
	self assert: (self methodFinder data = #(#(4 3) #(5 9)) ).
 	self assert: (self methodFinder answers = #( 7 14 )).