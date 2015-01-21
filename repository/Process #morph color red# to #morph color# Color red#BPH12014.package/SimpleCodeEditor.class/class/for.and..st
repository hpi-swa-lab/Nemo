as yet unclassified
for: aClass and: aMethodName
	^ self new
		clazz: aClass;
		methodName: aMethodName;
		initializeCodePane;
		yourself