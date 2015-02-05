as yet unclassified
append: aCompiledMethod
	| classToMethod |
	classToMethod := (aCompiledMethod methodClass) -> (aCompiledMethod selector).
	self methodList remove: classToMethod ifAbsent: [].
	self methodList addFirst: classToMethod.
	(self methodList size > 7) ifTrue: [ self methodList removeLast ]