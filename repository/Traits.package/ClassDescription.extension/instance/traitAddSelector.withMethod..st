*Traits-NanoKernel
traitAddSelector: selector withMethod: traitMethod
	"Add a method inherited from a trait. 
	Recompiles to avoid sharing and implement aliasing."
	| oldMethod source methodNode newMethod originalSelector |
	oldMethod := self compiledMethodAt: selector ifAbsent:[nil].
	oldMethod ifNotNil:[
		"The following is an important optimization as it prevents exponential
		growth in recompilation. If T1 is used by T2 and T2 by T3 then (without
		this optimization) any change in T1 would cause all methods in T2 to be
		recompiled and each recompilation of a method in T2 would cause T3
		to be fully recompiled. The test eliminates all such situations."
		(oldMethod sameTraitCodeAs: traitMethod) ifTrue:[^oldMethod].
	].
	originalSelector := traitMethod selector.
	source := traitMethod methodClass sourceCodeAt: originalSelector.
	originalSelector == selector ifFalse:[
		"Replace source selectors for aliases"
		source := self replaceSelector: originalSelector withAlias: selector in: source.
	].
	methodNode := self newCompiler
		compile: source in: self notifying: nil ifFail:[^nil].
	newMethod := methodNode generate: self defaultMethodTrailer.
	newMethod putSource: source fromParseNode: methodNode inFile: 2
		withPreamble: [:f | f cr; nextPut: $!; nextChunkPut: 'Trait method'; cr].
	newMethod originalTraitMethod: traitMethod.
	^super addSelectorSilently: selector withMethod: newMethod.