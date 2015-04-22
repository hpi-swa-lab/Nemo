instance creation
color: aColor width: aNumber
	^ self new
		widths: {aNumber. aNumber. aNumber. aNumber};
		colors: {aColor. aColor. aColor. aColor};
		yourself