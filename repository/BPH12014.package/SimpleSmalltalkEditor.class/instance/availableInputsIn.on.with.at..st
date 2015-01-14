as yet unclassified
availableInputsIn: aMethodSymbol on: aClass with: aMethodNode at: aString

	^aString
		ifEmpty: [
			(BPH1ParameterTypeTool availableVarsIn: aMethodSymbol
				on: aClass
				with: aMethodNode)
			collect: [ :curClass | curClass at: #name.]]
		ifNotEmpty: [
			(BPH1ParameterTypeTool
				availableMethodsOn: aString
				in: aMethodSymbol
				on: aClass
				with: aMethodNode)
			collect: [ :curMethodSymbol | curMethodSymbol asString.]]