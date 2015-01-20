two steps
allowed: aSel
	"Is aSel known to be harmless?"
	^ (Approved includes: aSel) or: [AddAndRemove includes: aSel]