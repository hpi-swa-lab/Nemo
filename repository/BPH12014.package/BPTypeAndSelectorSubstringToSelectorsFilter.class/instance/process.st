private-processing
process

	self methodSelectorList:
		(self findMethodSelectorsContaining: self selectorSubString forClass: self variableType)