testing
isOfClassOrSubClass: aClass
" Uses for matching clases in cases when generalizaqtion is needed. "
	^ (self exactClass == aClass ) or: [ self exactClass inheritsFrom: aClass].