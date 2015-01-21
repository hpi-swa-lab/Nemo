accessing
selectedClass
	^ self clazz
	"| name |
	(name := self clazzName) ifNil: [^ nil].
	^ Smalltalk at: name ifAbsent: [nil]"