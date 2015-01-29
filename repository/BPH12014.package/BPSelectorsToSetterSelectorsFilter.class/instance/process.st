private-processing
process

	self methodSetterSelectorList:
		(self methodSelectorList select: [ :selector | selector endsWith: ':' ])