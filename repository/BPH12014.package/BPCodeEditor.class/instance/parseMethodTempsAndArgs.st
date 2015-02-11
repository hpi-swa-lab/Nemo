as yet unclassified
parseMethodTempsAndArgs
	| list methodArgs temps |
	list := SHParserST80 new
		rangesIn: paragraph text asString
		classOrMetaClass: self model clazz
		workspace: nil
		environment: nil.
	temps := (list select: [ :range | range type = #patternTempVar])
				collect: [ :range | paragraph text asString copyFrom: range start to: range end].
	methodArgs := (list select: [ :range | range type = #patternArg])
						collect: [ :range | paragraph text asString copyFrom: range start to: range end].
	^ {temps. methodArgs}