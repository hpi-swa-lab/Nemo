blocks
returnFalseBlock
	"
	TObject new returnFalseBlock
	"
	^ 1.0 < 0 ifTrue: [
		3
	] ifFalse: [
		'horse'
	]