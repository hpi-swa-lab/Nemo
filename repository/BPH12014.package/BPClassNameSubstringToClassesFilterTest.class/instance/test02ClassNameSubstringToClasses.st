as yet unclassified
test02ClassNameSubstringToClasses
	| classNames |
	classNames := filter classNameSubstring: 'Example';
				 run;
				 classNames.
	self
		assert: classNames includes: BPExampleClass name