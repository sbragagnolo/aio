"
path := FileDirectory on: '/Users/ciprian/Playfield/llvm-3.1/install_clang-x86_dbg/'.
indexH := CLHeaderSpecification new
	fileName: (path / 'include/clang-c/Index.h') fullName ; 
	addOption: '-I', (path / 'include/clang/include') fullName.
	
builder := (CLForeignLibInterfaceGenerator for: #LibClang)
	platform: NativeBoostConstants mac32PlatformId libPath: (path / 'lib/libclang.dylib') fullName;
	addHeader: indexH;
	classPrefix: 'CX';
	ffiSelectorBlock: [:selector | (selector beginsWith: 'clang_') ifTrue:[selector copyFrom: 7 to: selector size] ifFalse: [ selector]];
	generate;
	openChanges.
	
or for multiple files 

path := FileDirectory on: '/Users/ciprian/Playfield/llvm-3.1/install_clang-x86/'.
includeDir := path / 'include/llvm-c'.
options := { '-I', (path / 'include') fullName.
	 '-D__STDC_CONSTANT_MACROS'.
	 '-D__STDC_LIMIT_MACROS'}.
	 
builder := (CLForeignLibInterfaceGenerator for: #LibLLVM)
	platform: NativeBoostConstants mac32PlatformId libPath: (path / 'lib/libLLVM.dylib') fullName;
	compilationOptions: options;
	includeDir: includeDir;
	addHeaderFiles: {'Core.h'. 'Object.h'. 'Analysis.h'. 'BitReader.h'. 'BitWriter.h'. 'Target.h'. 'TargetMachine.h'};
	classPrefix: 'LL';
	ffiSelectorBlock: [:selector | (selector beginsWith: 'LLVM') ifTrue:[(selector copyFrom: 5 to: selector size) withFirstCharacterDownshifted] ifFalse: [ selector withFirstCharacterDownshifted]];
	generate;
	openChanges.
	

"
Class {
	#name : #CLForeignLibInterfaceGenerator,
	#superclass : #Object,
	#instVars : [
		'headerSpecs',
		'mappingModel',
		'compilationOptions',
		'includeDir',
		'libraryPaths'
	],
	#category : #'TalkFFI-SmalltalkBinding'
}

{ #category : #'instance creation' }
CLForeignLibInterfaceGenerator class >> for: aLibraryName [
	^ self new initialize libraryName: aLibraryName
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> addHeader: aHeaderSpec [
	headerSpecs add: aHeaderSpec
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> addHeaderFile: aHeaderFilename [
	self
		addHeader:
			(CLHeaderSpecification new
				fileName: (self includeDir / aHeaderFilename) fullName;
				compilationOptions: self compilationOptions)
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> addHeaderFiles: aCollection [
	aCollection do:[:each | self addHeaderFile: each].
]

{ #category : #'generating ffi binding' }
CLForeignLibInterfaceGenerator >> checkFunctionAvailability [
	mappingModel
		libraryPath:
			(libraryPaths asDictionary
				at: Smalltalk os platformName
				ifAbsent: [ nil ])
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> classPrefix [
	^ mappingModel classPrefix 
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> classPrefix: anObject [
	mappingModel classPrefix: anObject 
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> codeGenerationVisitor [
	^ self subclassResponsibility 
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> compilationOptions [
	^compilationOptions
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> compilationOptions: aCollection [
	compilationOptions := aCollection 
]

{ #category : #'compiling methods' }
CLForeignLibInterfaceGenerator >> compileInit: aName in: aClass sendSelector: aSelector to: aClassList [
	| methodString |
	methodString := aName , Character cr asString.
	methodString := aClassList
		inject: methodString
		into: [ :str :each | str , Character cr asString , each , ' ' , aSelector , '.' ].
	self model compile: methodString in: aClass classified: 'class initialization'
]

{ #category : #'compiling methods' }
CLForeignLibInterfaceGenerator >> compileObjectInitializations [
	|gClasses|
	gClasses :=  self mappingModel generatedClasses.
	self
		compileInit: 'initializeStructs'
		in: self typeClass
		sendSelector: 'rebuildFieldAccessors'
		to: gClasses structClasses.
	self
		compileInit: 'initializeEnums'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses enumClasses.
	self
		compileInit: 'initializeCallbacks'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses callbackClasses.
	self
		compileInit: 'initializeUnions'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses unionClasses.
	self
		compileInit: 'initializeArrays'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses arrayClasses.
]

{ #category : #'compiling methods' }
CLForeignLibInterfaceGenerator >> compileTypeClassInitialization: aName [
	self model
		compile:
			('initialize<n><t>super initialize.' , '<n><t>self initializeStructs.' , '<n><t>self initializeEnums.'
				, '<n><t>self initializeCallbacks.' , '<n><t>self initializeArrays.' , '<n><t>self initializeUnions.') expandMacros
		in: (self model metaclassNamed: aName)
		classified: 'class initialization'
]

{ #category : #'compiling methods' }
CLForeignLibInterfaceGenerator >> compileTypemap: aTypemap in: aClass [
	| typeMapString |
	typeMapString := 'typeMap<n><t>^#(<1s>)'
		expandMacrosWith:
			(aTypemap associations
				inject: String new
				into: [ :str :a | str , a key asString , ' ' , a value printString , Character cr asString ]).
	self model compile: typeMapString in: (self model metaclassNamed: aClass) classified: 'type map'
]

{ #category : #'compiling classes' }
CLForeignLibInterfaceGenerator >> compileTypesClass [
	| cName |
	cName := self mappingModel typemapClassName.
	self model defineClass:
			('<1s> subclass: #<2s> instanceVariableNames: '''' classVariableNames: '''' poolDictionaries: '''' category: <3p>'
				expandMacrosWith: 'CLLibraryMap'
				with: cName
				with: self mappingModel bindingCategory).	
	"compile initialization method"
	self compileTypeClassInitialization: cName.
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> ffiSelectorBlock [
	^ mappingModel ffiSelectorBlock
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> ffiSelectorBlock: anObject [
	mappingModel ffiSelectorBlock: anObject
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> functionFilter: aOneArgBlock [
	mappingModel functionFilter: aOneArgBlock.
]

{ #category : #'generating ffi binding' }
CLForeignLibInterfaceGenerator >> generate [
	self compileTypesClass.
	headerSpecs do: [ :each | self wrapperForHeader: each ].
	self compileTypemap: self mappingModel typemap in: self mappingModel typemapClassName.
	self compileObjectInitializations.
	self model compile: self libraryHandleMethodString in: self typeClass  classified: 'library path'.
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> headerSpecs [
	^ headerSpecs
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> headerSpecs: anObject [
	headerSpecs := anObject
]

{ #category : #'generating ffi binding' }
CLForeignLibInterfaceGenerator >> ignoreUnsupported [
	^ mappingModel ignoreUnsupported
]

{ #category : #'generating ffi binding' }
CLForeignLibInterfaceGenerator >> implement [
	mappingModel model changes execute.
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> includeDir [
	^includeDir 
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> includeDir: aPath [

	includeDir := aPath 
]

{ #category : #'initialize-release' }
CLForeignLibInterfaceGenerator >> initialize [ 
	super initialize.
	headerSpecs  := OrderedCollection new.
	libraryPaths := Set new.
	mappingModel := CLMappingModel new.
	compilationOptions := OrderedCollection new.
]

{ #category : #'string generation' }
CLForeignLibInterfaceGenerator >> libraryHandleMethodString [
	| rStream wStream |
	wStream := String new writeStream.
	wStream nextPutAll: 'libraryNameOrHandle'; cr; tab.
	rStream := libraryPaths asOrderedCollection readStream.
	[ rStream atEnd ]
		whileFalse: [ 
			| lPath str |
			lPath := rStream next.
			str := '<1s> = <2p> <n><t><t>ifTrue:[^<3p>].' 
					expandMacrosWith: self platformIdGetter 
					with: lPath key 
					with: lPath value.
			wStream nextPutAll: str;
				cr; 
				tab ].
	wStream nextPutAll: 'self error: ''define your own path'''.
	^wStream contents
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> libraryName [
	^self mappingModel libraryName
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> libraryName: anObject [
	self mappingModel libraryName: anObject
]

{ #category : #'accessing private' }
CLForeignLibInterfaceGenerator >> mappingModel [ 
	^mappingModel 
]

{ #category : #'accessing private' }
CLForeignLibInterfaceGenerator >> model [

	^self mappingModel model 
]

{ #category : #'generating ffi binding' }
CLForeignLibInterfaceGenerator >> openChanges [ 
	"mappingModel model changes open."
	(ChangesBrowser new change: mappingModel model changes) open"openWithSpec"

]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> platform: aPlatform libPath: aLibraryPath [
	libraryPaths add: aPlatform -> aLibraryPath 
]

{ #category : #accessing }
CLForeignLibInterfaceGenerator >> platformIdGetter [
	^self subclassResponsibility 
]

{ #category : #'accessing private' }
CLForeignLibInterfaceGenerator >> typeClass [
	^ self model metaclassNamed: self mappingModel typemapClassName
]

{ #category : #'generating ffi binding' }
CLForeignLibInterfaceGenerator >> wrapperForHeader: aHeaderSpec [
	"create the wrapper class for the headerName "

	| headerAST |
	headerAST := (CLHeaderParser builder: CLNodeBuilder new)
		headerFile: aHeaderSpec fileName;
		compilationOptions: aHeaderSpec compilationOptions;
		functionFilter: mappingModel functionFilter;
		parseHeader.
	headerAST accept: CLOpaquePointerReduction new.
	headerAST accept: (CLNameGeneration defaultName: headerAST declarationName prefix: mappingModel classPrefix).
	^ headerAST
		accept:
			(self codeGenerationVisitor new
				mappingModel: mappingModel)
]
