accessing
color
	^ self colors detect: [ :color | color isTransparent not ] ifNone: [ Color transparent ]