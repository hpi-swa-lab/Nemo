context manage
primitiveTerminateTo
		^ (self matchOrFail: {{MethodContext }}) ifNotNil: [self createResult addReturn: MethodContext createType].