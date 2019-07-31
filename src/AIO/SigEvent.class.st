"
Sig event is a complex structure defined with some anonymous structures:

typedef struct sigevent {
	sigval_t sigev_value;
	int sigev_signo;
	int sigev_notify;
	union {
		int _pad[SIGEV_PAD_SIZE];
		 int _tid;

		struct {
			void (*_function)(sigval_t);
			void *_attribute;	/* really pthread_attr_t */
		} _sigev_thread;
	} _sigev_un;
} sigevent_t;

"
Class {
	#name : #SigEvent,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_SIGEV_NOTIFY',
		'OFFSET_SIGEV_SIGNO',
		'OFFSET_SIGEV_VALUE',
		'OFFSET__SIGEV_UN'
	],
	#category : #'AIO-Signal'
}

{ #category : #'library path' }
SigEvent class >> SIGEV_NONE [
	^ 1
]

{ #category : #'library path' }
SigEvent class >> SIGEV_SIGNAL [
	^ 0 
]

{ #category : #'library path' }
SigEvent class >> SIGEV_THREAD [
	^ 3
]

{ #category : #'library path' }
SigEvent class >> SIGIO [
	^ 29
]

{ #category : #'library path' }
SigEvent class >> ffiLibraryName [
	^ AIO
]

{ #category : #'library path' }
SigEvent class >> fieldsDesc [
"self rebuildFieldAccessors"

"void (*sigev_notify_function) (SigVal) "
	^ 
#(
  SigVal sigev_value;  
  int sigev_notify; 
  int sigev_signo;  
  SigInnerAnonymUnion _sigev_un;
)

 
]

{ #category : #'accessing structure variables' }
SigEvent >> _sigev_un [
	"This method was automatically generated"
	^ SigInnerAnonymUnion fromHandle: (handle referenceStructAt: OFFSET__SIGEV_UN length: SigInnerAnonymUnion byteSize)
]

{ #category : #'accessing structure variables' }
SigEvent >> _sigev_un: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET__SIGEV_UN put: anObject getHandle length: SigInnerAnonymUnion byteSize
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
