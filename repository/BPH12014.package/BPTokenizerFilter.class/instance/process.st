private-processing
process

	self tokens: (SHParserST80 new
		rangesIn: self sourceCode
		classOrMetaClass: self clazz
		workspace: nil
		environment: nil)