Utilities setAuthorInitials: 'travisCI'.
FileStream stdout nextPutAll: 'Author set'; cr; flush.
Transcript class compile: '
nextPutAll: aColl
	([FileStream stdout] on: Error do: [])
		ifNotNilDo: [:s | s nextPutAll: aColl; flush].
	^ super nextPutAll: aColl
'.
Transcript class compile: '
nextPut: aChar
	([FileStream stdout] on: Error do: [])
		ifNotNilDo: [:s | s nextPut: aChar; flush].
	^ super nextPut: aChar
'.
FileStream stdout nextPutAll: 'Transcript dupped'; cr; flush.

"Get the Metacello configuration (for Squeak users)"
Installer swasource
  project: 'SwaUtilities';
  addPackage: 'ConfigurationOfMetacello';
  install.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project version: #'previewBootstrap') load.

(Smalltalk at: #Metacello) new
  baseline: 'BPH12014';
  repository: 'filetree://', FileDirectory default fullName, '/repository';
  load.

"Prepare image for saving"
Preferences setPreference: #warnIfNoChangesFile toValue: false.
Preferences setPreference: #warnIfNoSourcesFile toValue: false.

PluggableSystemWindow allSubInstances do: [:w | w delete].

UIManager default
  edit: 'Welcome to our bachelor''s project' label: 'Welcome'.

SmalltalkImage current snapshot: true andQuit: true.