drawing
frameRectangle: r on: aCanvas 
	| innerRect |
	innerRect := Rectangle
		origin: r topLeft + (self widths fourth @ self widths first)
		corner: r bottomRight + (self widths second negated @ self widths third negated).
	aCanvas drawPolygon: {r topLeft. innerRect topLeft. innerRect topRight. r topRight} fillStyle: self colors first.
	aCanvas drawPolygon: {r bottomRight. innerRect bottomRight. innerRect topRight. r topRight} fillStyle: self colors second.
	aCanvas drawPolygon: {r bottomLeft. innerRect bottomLeft. innerRect bottomRight. r bottomRight} fillStyle: self colors third.
	aCanvas drawPolygon: {r topLeft. innerRect topLeft. innerRect bottomLeft. r bottomLeft} fillStyle: self colors fourth