parsing
isTemporaryVariable: aToken

	^#(#tempVar #blockTempVar workspaceVar ) identityIncludes: aToken type