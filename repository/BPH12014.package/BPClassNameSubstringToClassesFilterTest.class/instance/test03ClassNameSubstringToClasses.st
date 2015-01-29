as yet unclassified
test03ClassNameSubstringToClasses
	| classNames |
	classNames := filter classNameSubstring: 'Class';
				 run;
				 classNames.
	self
		assert: classNames includes: BPExampleClass name