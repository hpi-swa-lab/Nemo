comparing
= aBorderStyle
	^ (super = aBorderStyle
		and:[self widths = aBorderStyle widths])
		and:[self colors = aBorderStyle colors].