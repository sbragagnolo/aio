Class {
	#name : #SigUnion,
	#superclass : #FFIExternalUnion,
	#classVars : [
		'ReglasDelPadding'
	],
	#category : #AIO
}

{ #category : #'field definition' }
SigUnion class >> fieldsDesc [

"	self rebuildFieldAccessors "
	^ #(
	ReglasDelPadding _pad;
	int _tid;
      SigCallStruct _sigev_thread;)


]

{ #category : #'field definition' }
SigUnion class >> initialize [
	ReglasDelPadding := FFITypeArray ofType: 'int' size: 13.
	
]

{ #category : #'accessing structure variables' }
SigUnion >> _pad [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 13) fromHandle: (handle copyFrom: 1 to: 52)
]

{ #category : #'accessing structure variables' }
SigUnion >> _pad: anObject [
	"This method was automatically generated"
	handle replaceFrom: 1 to: 52 with: anObject getHandle startingAt: 1
]

{ #category : #'accessing structure variables' }
SigUnion >> _sigev_thread [
	"This method was automatically generated"
	^ SigCallStruct fromHandle: (handle referenceStructAt: 1 length: SigCallStruct byteSize)
]

{ #category : #'accessing structure variables' }
SigUnion >> _sigev_thread: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 8.
]

{ #category : #'accessing structure variables' }
SigUnion >> _tid [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : #'accessing structure variables' }
SigUnion >> _tid: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]
