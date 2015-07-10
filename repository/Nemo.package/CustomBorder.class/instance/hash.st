comparing
hash
	"hash is implemented because #= is implemented"
	^ super hash bitXor: (self widths hash bitXor: self colors hash)