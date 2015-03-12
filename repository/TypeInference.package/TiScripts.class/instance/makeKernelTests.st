as yet unclassified
"self new makeKernelTests "
makeKernelTests
	self testInheriter: 'KernelTests-Chronology'.
	self testInheriter: 'KernelTests-Classes'.
	self testInheriter: 'KernelTests-Exception'.
	self testInheriter: 'KernelTests-Methods'.
	self testInheriter: 'KernelTests-Numbers'.
	self testInheriter: 'KernelTests-Objects'.
	self testInheriter: 'KernelTests-Pragmas'.