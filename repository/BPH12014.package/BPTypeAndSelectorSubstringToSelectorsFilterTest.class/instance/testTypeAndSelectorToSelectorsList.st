as yet unclassified
testTypeAndSelectorToSelectorsList

	self assert: #(#method:)
		equals: (filter
			selectorSubString: 'ethod';
			variableType: BPExampleClass;
			run;
			methodSelectorList)