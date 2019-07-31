"
Extract of the SigEvent Type. See The inner definition of it. 
"
Class {
	#name : #SigInnerAnonymUnion,
	#superclass : #FFIExternalUnion,
	#classVars : [
		'Padding'
	],
	#category : #'AIO-Signal'
}

{ #category : #'field definition' }
SigInnerAnonymUnion class >> fieldsDesc [

"	self rebuildFieldAccessors "
	^ #(
	Padding _pad;
	int _tid;
      SigInnerAnonymStruct _sigev_thread;)


]

{ #category : #'field definition' }
SigInnerAnonymUnion class >> initialize [
	Padding := FFITypeArray ofType: 'int' size: 13.
	
]

{ #category : #'accessing structure variables' }
SigInnerAnonymUnion >> _pad [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 13) fromHandle: (handle copyFrom: 1 to: 52)
]

{ #category : #'accessing structure variables' }
SigInnerAnonymUnion >> _pad: anObject [
	"This method was automatically generated"
	handle replaceFrom: 1 to: 52 with: anObject getHandle startingAt: 1
]

{ #category : #'accessing structure variables' }
SigInnerAnonymUnion >> _sigev_thread [
	"This method was automatically generated"
	^ SigInnerAnonymStruct fromHandle: (handle referenceStructAt: 1 length: SigInnerAnonymStruct byteSize)
]

{ #category : #'accessing structure variables' }
SigInnerAnonymUnion >> _sigev_thread: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 8.
]

{ #category : #'accessing structure variables' }
SigInnerAnonymUnion >> _tid [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : #'accessing structure variables' }
SigInnerAnonymUnion >> _tid: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]
