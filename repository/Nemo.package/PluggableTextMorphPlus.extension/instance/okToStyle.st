*Nemo-Util
okToStyle
	"Need this dirty fix, because model can be nil, see NemoCodeUsageMorph>>initializeCodeMorph "
	styler ifNil:[^false].
	(model respondsTo: #aboutToStyle:) ifFalse: [^true].
	^model aboutToStyle: styler