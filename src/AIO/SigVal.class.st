"
SigVal defines a nuion of a pointer or an integer, to be able to pass two kinds of parameters and use them properly. 

typedef union sigval {
	int sival_int;
	void *sival_ptr;
} sigval_t;

"
Class {
	#name : #SigVal,
	#superclass : #FFIExternalUnion,
	#category : #'AIO-Signal'
}

{ #category : #'library path' }
SigVal class >> ffiLibraryName [
	^ AIO
]

{ #category : #'library path' }
SigVal class >> fieldsDesc [
"self rebuildFieldAccessors"
	^ 
#(int  sival_int;       
  void *sival_ptr;)
]

{ #category : #'accessing structure variables' }
SigVal >> sival_int [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : #'accessing structure variables' }
SigVal >> sival_int: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]

{ #category : #'accessing structure variables' }
SigVal >> sival_ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: 1) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigVal >> sival_ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: 1 put: anObject getHandle.
]
