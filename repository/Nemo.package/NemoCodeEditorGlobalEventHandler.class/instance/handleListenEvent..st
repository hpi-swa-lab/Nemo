events-processing
handleListenEvent: anEvent

		anEvent type = #mouseDown ifTrue: [ self mouseDownHandler value: anEvent. ].