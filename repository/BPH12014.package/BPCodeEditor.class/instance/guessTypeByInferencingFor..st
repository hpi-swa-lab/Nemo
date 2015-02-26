as yet unclassified
guessTypeByInferencingFor: anExpressionString

	| typeSet |
	'123' asNumber.
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