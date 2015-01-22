*BPH12014-UI
textHeight

	^(self editor paragraph lines collect: [ :line |
		line lineHeight.
	]) sum