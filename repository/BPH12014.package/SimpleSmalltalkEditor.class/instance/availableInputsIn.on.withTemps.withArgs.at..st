as yet unclassified
availableInputsIn: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList at: aString

	^aString
		ifEmpty: [
			(BPH1ParameterTypeTool availableVarsIn: aMethodSymbol
				on: aClass
				withTemps: aTempVarNameList
				withArgs: aArgsVarNameList)
			collect: [ :curClass | curClass at: #name.]]
		ifNotEmpty: [
			(BPH1ParameterTypeTool
				availableMethodsOn: aString
				in: aMethodSymbol
				on: aClass
				withTemps: aTempVarNameList
				withArgs: aArgsVarNameList)
			collect: [ :curMethodSymbol | curMethodSymbol asString.]]