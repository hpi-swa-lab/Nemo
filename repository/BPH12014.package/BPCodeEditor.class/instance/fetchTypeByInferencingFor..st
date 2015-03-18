as yet unclassified
fetchTypeByInferencingFor: anExpressionString

	| typeSet |
	anExpressionString ifNil: [ ^ nil ].
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