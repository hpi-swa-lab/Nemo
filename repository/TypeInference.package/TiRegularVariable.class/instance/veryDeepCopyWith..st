accessing
veryDeepCopyWith: aContextualDeepCopier
" in the application, the way to call veryDeepCopyWith: is with a ContextualDeepCopier instance, that comes with contextual information of the copy. "

	(aContextualDeepCopier isKindOf: ContextualDeepCopier) ifTrue: [
		"if is a block, the used variable is the same of the context"
		self debug:[ ' Calling for a copy with a contextual copier : ' , aContextualDeepCopier context. ].
		(aContextualDeepCopier context = ContextualDeepCopier block ) ifTrue:[
			^self	
		].
	] .
	^super veryDeepCopyWith: aContextualDeepCopier.
	