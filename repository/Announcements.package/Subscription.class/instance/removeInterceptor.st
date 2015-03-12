interceptors
removeInterceptor

	interceptors removeLast.
	interceptors ifEmpty: [ interceptors := nil ]