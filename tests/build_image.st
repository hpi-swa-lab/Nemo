Utilities setAuthorInitials: 'travisCI'.
FileStream stdout nextPutAll: 'Author set'; cr; flush.

Transcript class compile: '
nextPutAll: aColl
	([FileStream stdout] on: Error do: [])
		ifNotNilDo: [:s | s nextPutAll: aColl; flush].
	^ super nextPutAll: aColl
'.
FileStream stdout nextPutAll: 'Transcript #nextPutAll: dupped'; cr; flush.

Transcript class compile: '
nextPut: aChar
	([FileStream stdout] on: Error do: [])
		ifNotNilDo: [:s | s nextPut: aChar; flush].
	^ super nextPut: aChar
'.
FileStream stdout nextPutAll: 'Transcript #nextPut: dupped'; cr; flush.

"Get the Metacello configuration (for Squeak users)"
Installer swasource
  project: 'SwaUtilities';
  addPackage: 'ConfigurationOfMetacello';
  install.
FileStream stdout nextPutAll: 'Installed Metacello'; cr; flush.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project version: #'previewBootstrap') load.
FileStream stdout nextPutAll: 'Bootstrapped Metacello Preview'; cr; flush.

(Smalltalk at: #Metacello) new
  baseline: 'BPH12014';
  repository: 'filetree://', FileDirectory default fullName, '/repository';
  load.
FileStream stdout nextPutAll: 'Installed BPH12014 baseline'; cr; flush.

"Prepare image for saving"
Preferences setPreference: #warnIfNoChangesFile toValue: false.
Preferences setPreference: #warnIfNoSourcesFile toValue: false.
FileStream stdout nextPutAll: 'Prepared image for saving'; cr; flush.

PluggableSystemWindow allSubInstances do: [:w | w delete].
FileStream stdout nextPutAll: 'Closed all windows'; cr; flush.

UIManager default
  edit: 'Welcome to our bachelor''s project.

In the open code editor window you can try a few of our showcases.
The code that is already present is a standard method from
the OrderedCollection class. This would be a sample of how to edit
method within this new Code-Editor prototype.

Some interesting Hotkey combinations that work in there are:

[ALT] + H - Invokes the MethodFinder at the caret. This requires
a valid MethodFinder expression as e.g. #((3 4) 7)
which should also return 3+4.

[ALT] + J - Open a find-all input field. This is still WIP.
This field also takes method finder expressions like above,
but can also display a lot of context information about the
code snippet that your are editing and the variables and types
that are currently involved.' label: 'Welcome'.
FileStream stdout nextPutAll: 'Created welcome message, now quitting'; cr; flush.

SmalltalkImage current snapshot: true andQuit: true.
