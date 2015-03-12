accessing
classAt: aClass
	^ classes at: aClass 
		ifAbsentPut: [TiClass new setClass: aClass]