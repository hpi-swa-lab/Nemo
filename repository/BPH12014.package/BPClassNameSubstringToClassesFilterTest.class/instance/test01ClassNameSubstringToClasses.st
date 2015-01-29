as yet unclassified
test01ClassNameSubstringToClasses
	| classNames |
	classNames := filter classNameSubstring: 'ExampleClass';
				 run;
				 classNames.
	self
		assert: classNames includes: BPExampleClass name