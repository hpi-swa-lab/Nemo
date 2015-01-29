as yet unclassified
test04ClassNameSubstringToClasses
	| classNames |
	classNames := filter classNameSubstring: 'xampl';
				 run;
				 classNames.
	self
		assert: classNames includes: BPExampleClass name