instance creation
colorsAndWidths: aColorWidthPairsCollection
	^ self new
		colors: {aColorWidthPairsCollection first. aColorWidthPairsCollection third. aColorWidthPairsCollection fifth. aColorWidthPairsCollection seventh};
		widths: {aColorWidthPairsCollection second. aColorWidthPairsCollection fourth. aColorWidthPairsCollection sixth. aColorWidthPairsCollection eighth};
		yourself