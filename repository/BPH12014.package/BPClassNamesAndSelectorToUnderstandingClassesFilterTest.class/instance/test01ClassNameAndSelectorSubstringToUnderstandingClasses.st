as yet unclassified
test01ClassNameAndSelectorSubstringToUnderstandingClasses
	| classNames |
	classNames := filter classNames: #(#BPExampleClass #Morph #BPFilter);
				methodSelector: #method:;
				run;
				classesUnderstandingSelector.
	self
		assert: classNames includes: BPExampleClass name