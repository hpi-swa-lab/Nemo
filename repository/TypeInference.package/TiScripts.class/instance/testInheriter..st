as yet unclassified
"self new testInheriter: 'KernelTests-Chronology'"
testInheriter: aCategory
	(TestCase allSubclasses select:[:subClass| subClass category = aCategory ] ) do: [ :subClass | 
		|class| 
		class := 
		subClass subclass: (subClass name, 'ForTi') asSymbol 
		uses: TInference
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'TypeInference-Test-',aCategory.
		
		(subClass methodDict keys select:[ :selector | selector beginsWith: 'test' ] )do:[ :selector | 
			|call |
			call := ''' self ', selector, ''' '.
			class compile: selector, 'Launcher', Character cr asString, ' ^self baseTypeTest:',call,' usingForSelf: self .'.
		].
	].

