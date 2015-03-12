context manage
primitiveFindHandlerContext
		^ (self matchOrFail: {{MethodContext }}) ifNotNil: [
			self createResult addReturn: MethodContext createType
		].