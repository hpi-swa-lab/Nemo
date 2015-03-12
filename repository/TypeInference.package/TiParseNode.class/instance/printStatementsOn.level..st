printing
printStatementsOn: aStream level: levelOrZero
	"see BlockNode printStatementsOn:indent: "
	| len shown thisStatement level |
	level := 1 max: levelOrZero.
	len := shown := self statements size.
	(levelOrZero = 0 "top level" and: [self statements last isReturnSelf])
		ifTrue: [shown := 1 max: shown - 1]
		ifFalse: [(len = 1 and: [((self statements at: 1) isNodeNil)])
					ifTrue: [shown := shown - 1]].
	1 to: shown do: 
		[:i | 
		thisStatement := self statements at: i.
		thisStatement printOn: aStream level: level.
		i < shown ifTrue: [aStream nextPut: $.; crtab: level]]