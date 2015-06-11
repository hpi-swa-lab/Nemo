as yet unclassified
forceSandbox
	SecurityManager default
		secureUserDirectory;
		disableImageWrite;
		flushSecurityKeys;
		disableFileAccess;
		disableSocketAccess.
	FileDirectory setDefaultDirectory: SecurityManager default untrustedUserDirectory