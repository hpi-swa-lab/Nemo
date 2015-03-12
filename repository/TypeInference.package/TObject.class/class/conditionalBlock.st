blocks
conditionalBlock
	"
	TObject conditionalBlock
	"
	1 < 0
		ifTrue: [^ 1]
		ifFalse: [1.0 < 0.0 
					ifTrue: [^ 1.0]
					ifFalse: [$b < $a ifTrue: [^ $a]]].
	^ #bye