styling
styleCode: aString inClass: aClass

	| styler |
	styler := SHTextStylerST80 new.
	styler classOrMetaClass: aClass.
	^ (styler styledTextFor: aString asText).