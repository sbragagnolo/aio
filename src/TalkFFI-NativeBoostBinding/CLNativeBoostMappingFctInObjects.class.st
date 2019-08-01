Class {
	#name : #CLNativeBoostMappingFctInObjects,
	#superclass : #CLNativeBoostMappingFlatArray,
	#category : #'TalkFFI-NativeBoostBinding'
}

{ #category : #'accessing mapping' }
CLNativeBoostMappingFctInObjects >> classFor: aTypeName [
	| class |
	(aTypeName asString beginsWith: 'NB')
		ifTrue: [ ^ nil ].
	class := self typemap at: aTypeName ifAbsent: [ nil ].
	(class notNil and: [ class beginsWith: 'NB' ])
		ifTrue: [ class := nil ].
	^ class ifNil: [ self classNamed: aTypeName asSymbol ] ifNotNil: [ self classNamed: class asSymbol ]
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> compileExternalTypeAlias: aClassName [
	self
		compile: ('externalTypeAlias: aTypeName<n><t>^ <1s> at: aTypeName ifAbsent:[aTypeName]' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'nativeboost types'
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> compileInstanceNbLibraryNameOrHandle: aClassName [
	self
		compile: 'nbLibraryNameOrHandle<n><t>^ self class nbLibraryNameOrHandle' expandMacros 
		in: (self classNamed: aClassName)
		classified: 'library path'
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> defineCallbackClass: aName [
	|ret|
	ret := super defineCallbackClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> defineEnumClass: aName [
	|ret|
	ret := super defineEnumClass: aName.
	self compileNbBindingOf: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> defineOpaqueClass: aName [
	|ret|
	ret := super defineOpaqueClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> defineStructClass: aName [
	|ret|
	ret := super defineStructClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> defineUnionClass: aName [
	|ret|
	ret := super defineUnionClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret
]

{ #category : #'as yet unclassified' }
CLNativeBoostMappingFctInObjects >> fnMethodString: aNamedSignature [

	^ '<1s><n><t><2s>primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode<3s><n><t>^self nbCall: <4s> options: #( <5s> )'
		expandMacrosWithArguments:
			{(self selectorString: aNamedSignature).
			'<'.
			'>'.
			(self fnSignatureString: aNamedSignature).
			((mayGC at: aNamedSignature second) ifTrue: [ 'optMayGC' ] ifFalse: [ '' ])}.
			
]

{ #category : #'accessing mapping' }
CLNativeBoostMappingFctInObjects >> metaclassFor: aTypeName [
	| class |
	(aTypeName asString beginsWith: 'NB')
		ifTrue: [ ^ nil ].
	class := self typemap at: aTypeName ifAbsent: [ nil ].
	(class notNil and: [ class beginsWith: 'NB' ])
		ifTrue: [ class := nil ].
	^ class ifNil: [ self metaclassNamed:  aTypeName asSymbol  ] ifNotNil: [ self metaclassNamed: class asSymbol  ]
]

{ #category : #visiting }
CLNativeBoostMappingFctInObjects >> visitCLFunctionDeclaration: aNode [
	| node signature compObj compClass defaultBlock |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self checkAvailability: aNode declarationName.
	signature := aNode signature accept: self.
	defaultBlock := [ self compileFnCall: aNode declarationName signature: signature in: (self classNamed: headerClass) ].	
	"get the type of the first argument"
	signature last ifNotEmpty: [ compObj := self classFor: signature last first key ].
	^ compObj
		ifNil: [ 
			compClass := self metaclassFor: signature first.
			compClass
				ifNil: [ defaultBlock value ]
				ifNotNil: [ self compileFnCall: aNode declarationName signature: signature in: compClass ] ]
		ifNotNil: [ 
			signature := signature deepCopy.
			signature last at: 1 put: 'self'.
			self compileFnCall: aNode declarationName signature: signature in: compObj ]
]
