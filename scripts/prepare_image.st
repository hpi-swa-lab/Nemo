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
To open a modified Browser, evaluate:
  
  NemoBrowser open


ALT+Q - Move the cursor behind a code snippet (literal, global or instance or temporary varibale) and press ALT+Q to trigger type inferencing to displays methods that can be invoked on the given return value. If you are using UNIX-based OS, you can also get suggestions for the return value of expressions (e.g. "Morph new" or "Color red" or "(Color red alpha 0.5)").

To get a ranked list of selectors, you need to scan some packages of the image, so that we can build Markov-chains. Do-it:

  "Register some observers"
  NemoObserverManager default
    reset;
    addObserver: NemoMarkovObserver new;
    addObserver: NemoSelectorInfoObserver new.
    
  "Add Packages to scan"
  NemoObserverManager default
    addPackage: ''Morphic'';
    addPackage: ''System'';
    addPackage: ''Collections'';
    "..."
    start.' label: 'Welcome to Nemo'.

FileStream stdout nextPutAll: 'Created welcome message'; cr; flush.

SmalltalkImage current snapshot: true andQuit: true.
!
