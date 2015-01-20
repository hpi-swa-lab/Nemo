Find a method in the system from a set of examples.  Done by brute force, trying every possible selector.  Errors are skipped over using ( [3 + 'xyz'] ifError: [^ false] ).
Submit an array of the form ( (data1 data2) answer  (data1 data2) answer).

	MethodFinder methodFor: #( (4 3) 7  (0 5) 5  (5 5) 10).

answer:  'data1 + data2'

More generally, use the brace notation to construct live examples.

The program tries data1 as the receiver, and
	tries all other permutations of the data for the receiver and args, and
	tries leaving out one argument, and
	uses all selectors data understands, and
	uses all selectors in all of data's superclasses.

Floating point values must be precise to 0.01 percent, or (X * 0.0001).

See method greatExamples for a list of what the MethodFinder can do.

If you get a Notifier window, you have probably discovered a selector that needs to be removed from the Approved list.  See MethodFinder.initialize.  Please email the Squeak Team.

Only considers 0, 1, 2, and 3 argument messages.  The argument data may have 1 to 5 entries, but only a max of 4 used at a time.  For now, we only test messages that use given number of args or one fewer.  For example, this data (100 true 0.6) would test the receiver plus two args, and the receiver plus one arg, but not any other patterns.

Three sets of selectors:  Approved, AddAndRemove, and Blocks selectors.  When testing a selector in AddAndRemove, deepCopy the receiver.  We do not handle selectors that modify an argument (printOn: etc.).  Blocks is a set of (selector argNumber) where that argument must be a block.

For perform, the selector is tested.  It must be in the Approved list.

do: is not on the Approved list.  It does not produce a result that can be tested.  Type 'do' into the upper pane of the Selector Finder to find messages related to 'do'.

Future Improvements:
1.  Later, allow the user to supply a block that tests the answer, not just the literal answer.
2.  When searching for ifTrue:ifFalse: as in (MethodFinder methodFor: { { true. [3]. [4]}. 3})  allow this to work without the brackets around 3 and 4.  Allow this for any 0-argument block in the input.

MethodFinder methodFor: #( (4 3) 7  (0 5) 5  (5 5) 10).
This will discover (data1 + data2).
data		#( (4 3)   (0 5)   (5 5) )
answers	#(  7 		  5  	 10)
argMap			map the arguments into a new order
thisData		the permutation of receiver and args that we are testing now.
selector		OC of the successful selectors.
expressions	OC of the successful expressions. ( 'data1 + data2' )
objects			OC of arrays of (reciever arg1 arg1), one for each successful expressions.
resultsList		OC of triples of ( selector,  expression string,  receiver and arg objects )
							(printStringBase:  'data2 printStringBase: data1'  (2 4))
mapStage		to find all permutations of the arguments
mapList		list of all permutations of the arguments
cachedClass			class being tested.
cachedArgNum			their numbers of arguments
cachedSelectorLists	for the class being tested, all of its selectors.


