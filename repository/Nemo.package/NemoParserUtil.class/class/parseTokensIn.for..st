parsing
parseTokensIn: aSourceCodeString for: aClass 
	^ SHParserST80 new
		rangesIn: aSourceCodeString
		classOrMetaClass: aClass
		workspace: nil
		environment: nil