Class {
	#name : #SigEvent,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_SIGEV_NOTIFY',
		'OFFSET_SIGEV_NOTIFY_ATTRIBUTES',
		'OFFSET_SIGEV_NOTIFY_FUNCTION',
		'OFFSET_SIGEV_NOTIFY_THREAD_ID',
		'OFFSET_SIGEV_SIGNO',
		'OFFSET_SIGEV_VALUE'
	],
	#category : #AIO
}

{ #category : #'library path' }
SigEvent class >> ffiLibraryName [
	^ AIO
]

{ #category : #'library path' }
SigEvent class >> fieldsDesc [
"self rebuildFieldAccessors"

"void (*sigev_notify_function) (SigVal) "
	^ 
#(int sigev_notify; 
  int sigev_signo;  
  SigVal sigev_value;  
  void* sigev_notify_function;
  void* sigev_notify_attributes;
  int32 sigev_notify_thread_id;)
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SIGEV_NOTIFY
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SIGEV_NOTIFY put: anObject
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify_attributes [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SIGEV_NOTIFY_ATTRIBUTES) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify_attributes: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SIGEV_NOTIFY_ATTRIBUTES put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify_function [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SIGEV_NOTIFY_FUNCTION) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify_function: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SIGEV_NOTIFY_FUNCTION put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify_thread_id [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SIGEV_NOTIFY_THREAD_ID
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_notify_thread_id: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SIGEV_NOTIFY_THREAD_ID put: anObject
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_signo [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SIGEV_SIGNO
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_signo: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SIGEV_SIGNO put: anObject
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_value [
	"This method was automatically generated"
	^ SigVal fromHandle: (handle referenceStructAt: OFFSET_SIGEV_VALUE length: SigVal byteSize)
]

{ #category : #'accessing structure variables' }
SigEvent >> sigev_value: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_SIGEV_VALUE put: anObject getHandle length: SigVal byteSize
]
