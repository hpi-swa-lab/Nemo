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

In the open browser window you can try a few of our showcases.
Some interesting Hotkey combinations that work in there are:

[ALT] + Q - Invokes first the MethodFinder that will try to
evaluate the line. If that yields no results, it will invoke
the type inferencing methods, and display methods that can possibly
be invoked on the given arguments.

E.g. for the method finder try:

3 4 7

for the type-inferencing try (caret after the morph on the 2nd line):

morph := Morph new.
morph

[ALT] + J - Tries to find results solely based 
on the image''s source code. This only uses a Markov-Chain under 
the hood.' label: 'Welcome'.
FileStream stdout nextPutAll: 'Created welcome message'; cr; flush.

BPMarkovFromASTObserver default addPackage: 'System'.
BPMarkovFromASTObserver default addPackage: 'Morphic'.
BPMarkovFromASTObserver default addPackage: 'Collections'.
BPMarkovFromASTObserver default start.
FileStream stdout nextPutAll: 'Finished analysing the relevant Squeak source code AST'; cr; flush.

BPBrowser open.
FileStream stdout nextPutAll: 'Opened browser, now quitting'; cr; flush.

SmalltalkImage current snapshot: true andQuit: true.
