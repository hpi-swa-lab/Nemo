load-unload
storeTraitInfoInClass: aClass
	"Store trait information in the given class"
	| code |
	code := WriteStream on: (String new: 100).
	code nextPutAll: 'traitInfo
	"This method contains information to restore the trait structure
	for the receiver when traits are loaded or unloaded"'.
	aClass isTrait ifTrue:[
		code crtab; nextPutAll: '"This class was originally a trait"'.
		code crtab; nextPutAll: '<traitDefinition: true>'.
	].
	aClass hasTraitComposition ifTrue:[
		code crtab; nextPutAll: '"The trait composition for the receiver"'.
		code crtab; nextPutAll: '<traitComposition: ', aClass traitCompositionString storeString,'>'.
		code crtab; nextPutAll: '"The required traits for this trait"'.
		code crtab; nextPutAll: '<traitRequires: ', (aClass traits collect:[:t| t baseTrait name]),'>'.
	].
	aClass compile: code contents.
