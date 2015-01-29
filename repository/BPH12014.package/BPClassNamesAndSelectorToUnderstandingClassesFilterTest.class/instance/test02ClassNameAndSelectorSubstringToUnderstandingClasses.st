as yet unclassified
test02ClassNameAndSelectorSubstringToUnderstandingClasses
	| classNames |
	classNames := filter classNames: #(#BPExampleClass #Morph #BPFilter);
				methodSelector: #exampleClass;
				run;
				classesContainingSelector.
	self
		assert: classNames includes: BPExampleClass name