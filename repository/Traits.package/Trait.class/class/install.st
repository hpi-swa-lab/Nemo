load-unload
install
	"Make me the default Trait implementation"
	ClassDescription traitImpl: self.
	"And restore any previously flattened traits"
	self restoreAllTraits.
