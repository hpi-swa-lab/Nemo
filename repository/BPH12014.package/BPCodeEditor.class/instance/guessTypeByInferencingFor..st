as yet unclassified
guessTypeByInferencingFor: anExpressionString

	| typeSet |
	typeSet := (Compiler new analyze: anExpressionString
						in:  nil
						to: nil
						notifying: nil
						ifFail: [ :fail | ^ nil ]) return.

	^ ((typeSet
		collect: [ :aTiObjectType | aTiObjectType exactClass ])
		select: [ :aClass | (aClass = UndefinedObject) not.])
		ifEmpty: [ ^ nil ]
		ifNotEmptyDo: [ :filteredTypeSet | ^ filteredTypeSet ]