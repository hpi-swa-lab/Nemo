printing
printArgumentsOn: aStream level: level
	"copied from BlockNode printArgumentsOn:indent:"

	arguments size = 0
		ifFalse: 
			[arguments do: 
				[:arg | 
				aStream nextPut: $:.
				aStream withAttribute: (TextColor color: Color green)
					do: [aStream nextPutAll: arg name].
				aStream space].
			aStream nextPutAll: '| '.
			"If >0 args and >1 statement, put all statements on separate lines"
			statements size > 1 ifTrue: [aStream crtab: level]]