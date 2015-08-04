[![Build Status](https://secure.travis-ci.org/HPI-SWA-Lab/Nemo.png?branch=master)](http://travis-ci.org/HPI-SWA-Lab/Nemo)

[![Try Now](http://img.shields.io/badge/try-now-green.svg)](https://bertfreudenberg.github.io/SqueakJS/run#url=https://www.hpi.uni-potsdam.de/hirschfeld/artefacts/nemo/&files=[Nemo-Squeak4.6.image,Nemo-Squeak4.6.changes,SqueakV41.sources]) = in your browser

### Nemo: Finden Statt Suchen! _Find, Don't Seek!_

> We're on trunk / 4.6!

For convenience, we always have the latest compiling images & changes available for you [here](https://www.hpi.uni-potsdam.de/hirschfeld/artefacts/nemo/).


## Installation
```Smalltalk	
Metacello new
  baseline: 'Nemo';
  repository: 'github://HPI-SWA-LAB/Nemo/repository';
  load.
```

## How to use our tool

To open a modified Browser, evaluate:

```Smalltalk	
	NemoBrowser open
```

ALT+Q - Move the cursor behind a code snippet (literal, global or instance or temporary varibale) and press ALT+Q to trigger type inferencing to displays methods that can be invoked on the given return value. If you are using UNIX-based OS, you can also get suggestions for the return value of expressions (e.g. "Morph new" or "Color red" or "(Color red alpha 0.5)").

To get a ranked list of selectors, you need to scan some packages of the image, so that we can build Markov-chains. Do-it:

```Smalltalk
	"Register some observers"
	NemoObserverManager default
		reset;
		addObserver: NemoMarkovObserver new;
		addObserver: NemoSelectorInfoObserver new.
```

```Smalltalk
	"Add Packages to scan"
	NemoObserverManager default
		addPackage: 'Morphic';
		addPackage: 'System';
		addPackage: 'Collections';
		"..."
		start.
```
