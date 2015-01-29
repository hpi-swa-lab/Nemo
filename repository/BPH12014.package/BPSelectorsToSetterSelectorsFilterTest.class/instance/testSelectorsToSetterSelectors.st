as yet unclassified
testSelectorsToSetterSelectors

	self assert: #('abc:' 'def:')
		equals: (filter
			methodSelectorList: #(#abcdfg #abc: #def: #abc #def);
			run;
			methodSetterSelectorList)