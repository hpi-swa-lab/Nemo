as yet unclassified
forceSandbox
	SecurityManager default
		disableImageWrite;
		flushSecurityKeys;
		disableFileAccess;
		disableSocketAccess.
	FileDirectory setDefaultDirectory: SecurityManager default untrustedUserDirectory.
	SoundService soundEnabled: false.