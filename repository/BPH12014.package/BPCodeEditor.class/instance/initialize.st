as yet unclassified
initialize

		super initialize.
		self globalEventHandler: (NemoCodeEditorGlobalEventHandler new
				mouseDownHandler: [ :aMouseEvent | self onClickAnwhere: aMouseEvent ]).