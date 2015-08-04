"Get the Metacello configuration (for Squeak users)"
Installer gemsource
    project: 'metacello';
    addPackage: 'ConfigurationOfMetacello';
    install.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.

"Now load latest version of Metacello"
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  get.
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  load.

"If e.g. your tests change code in the image dynamically, the image will require you to set 
author initials which might fail these tests. So we set some dummy initials here to avoid this."
(Smalltalk at: #MetacelloPlatform) current authorName: 'Nemo'.

"Load Nemo into image"
Metacello new
  baseline: 'Nemo';
  repository: 'github://HPI-SWA-LAB/Nemo/repository';
  load.

"Start Nemo"
PluggableSystemWindow allSubInstances do: [:w | w delete].
FileStream stdout nextPutAll: 'Closed all windows'; cr; flush.

UIManager default
  edit: 'Welcome to Nemo.

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
the hood.' label: 'Welcome to Nemo'.

FileStream stdout nextPutAll: 'Created welcome message'; cr; flush.

"BPMarkovFromASTObserver default addPackage: 'System'.
BPMarkovFromASTObserver default addPackage: 'Morphic'.
BPMarkovFromASTObserver default addPackage: 'Collections'.
BPMarkovFromASTObserver default start.
FileStream stdout nextPutAll: 'Finished analysing the relevant Squeak source code AST'; cr; flush."

"BPBrowser open.
FileStream stdout nextPutAll: 'Opened browser, now quitting'; cr; flush."

SmalltalkImage current snapshot: true andQuit: true.
!
