accessing
asString 
	^ pih asString, '@', timestamp asString, ' #', originObject class name, '>>', originSelector,'::', logBlock value asString.