instance creation
colorTop: colorTop right: colorRight bottom: colorBottom left: colorLeft widthTop: widthTop right: widthRight bottom: widthBottom left: widthLeft
	^ self new
		widths: {widthTop. widthRight. widthBottom. widthLeft};
		colors: {colorTop. colorRight. colorBottom. colorLeft};
		yourself