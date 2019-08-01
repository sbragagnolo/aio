Class {
	#name : #CLLibraryMap,
	#superclass : #Object,
	#classInstVars : [
		'typeMap'
	],
	#category : #'TalkFFI-Runtime'
}

{ #category : #accessing }
CLLibraryMap class >> at: aSymbol [
	^ self at: aSymbol ifAbsent: [ super nbBindingOf: aSymbol ]
]

{ #category : #accessing }
CLLibraryMap class >> at: aSymbol ifAbsent: aBlock [
	^ typeMap at: aSymbol ifAbsent: aBlock
]

{ #category : #'class initialization' }
CLLibraryMap class >> initialize [
	super initialize.
	self initializeTypeMap
]

{ #category : #'class initialization' }
CLLibraryMap class >> initializeTypeMap [
	typeMap := Dictionary newFromPairs: self typeMap.
]

{ #category : #accessing }
CLLibraryMap class >> libraryNameOrHandle [
	^self subclassResponsibility 
]

{ #category : #accessing }
CLLibraryMap class >> typeMap [
	^#()
]
