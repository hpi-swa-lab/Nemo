as yet unclassified
format: aLogEntity
	| result arguments |
	
	result := pattern copyReplaceAll:  PatternLogFormatter pih with: aLogEntity pih asString.
	result := result copyReplaceAll:  PatternLogFormatter log with: aLogEntity logBlock value asString.
	result := result copyReplaceAll:  PatternLogFormatter classSymbol with: aLogEntity originClass name.
	result := result copyReplaceAll:  PatternLogFormatter selector with: aLogEntity originSelector.	
	result := result copyReplaceAll:  PatternLogFormatter timestamp with: aLogEntity timestamp asString.
	result := result copyReplaceAll:  PatternLogFormatter tag with: aLogEntity tag.
	
	arguments := aLogEntity arguments  collect:#asString.
	
	arguments size > 0 ifTrue: [ 
		result := result copyReplaceAll:  PatternLogFormatter argument with: arguments asString.			
	] ifFalse:[
		result := result copyReplaceAll:  PatternLogFormatter argument with: ''.
	].

	^result.