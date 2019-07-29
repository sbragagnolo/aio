Class {
	#name : #AIOFileHandle,
	#superclass : #FFIExternalStructure,
	#instVars : [
		'read',
		'write',
		'buffer'
	],
	#classVars : [
		'Char32',
		'OFFSET_AIO_BUF',
		'OFFSET_AIO_FILDES',
		'OFFSET_AIO_LIO_OPCODE',
		'OFFSET_AIO_NBYTES',
		'OFFSET_AIO_OFFSET',
		'OFFSET_AIO_REQPRIO',
		'OFFSET_AIO_SIGEVENT',
		'OFFSET___ABS_PRIO',
		'OFFSET___ERROR_CODE',
		'OFFSET___GLIBC_RESERVED',
		'OFFSET___NEXT_PRIO',
		'OFFSET___POLICY',
		'OFFSET___RETURN_VALUE'
	],
	#category : #AIO
}

{ #category : #'field definition' }
AIOFileHandle class >> ffiLibraryName [
	^ AIO
]

{ #category : #'field definition' }
AIOFileHandle class >> fieldsDesc [
"self rebuildFieldAccessors"
	^ 
#(
  int aio_fildes;	
  int aio_lio_opcode;
  int aio_reqprio;
   void *aio_buf;	
  size_t aio_nbytes;		
  SigEvent aio_sigevent;

  void*__next_prio;
  int __abs_prio;
  int __policy;
  int __error_code;
  int __return_value;
  long aio_offset;		
  Char32 __glibc_reserved;
)


]

{ #category : #'field definition' }
AIOFileHandle class >> initialize [ 
	Char32 :=  FFITypeArray ofType: 'char' size: 32+28.
	
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __abs_prio [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET___ABS_PRIO
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __abs_prio: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET___ABS_PRIO put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __error_code [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET___ERROR_CODE
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __error_code: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET___ERROR_CODE put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __glibc_reserved [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 60) fromHandle: (handle copyFrom: OFFSET___GLIBC_RESERVED to: OFFSET___GLIBC_RESERVED + 59)
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __glibc_reserved: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET___GLIBC_RESERVED to: OFFSET___GLIBC_RESERVED + 59 with: anObject getHandle startingAt: 1
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __next_prio [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET___NEXT_PRIO) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __next_prio: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET___NEXT_PRIO put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __policy [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET___POLICY
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __policy: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET___POLICY put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __return_value [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET___RETURN_VALUE
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> __return_value: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET___RETURN_VALUE put: anObject
]

{ #category : #'as yet unclassified' }
AIOFileHandle >> aioReturn [
^ self ffiCall:#(int aio_return(self))
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_buf [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_AIO_BUF) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_buf: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_AIO_BUF put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_fildes [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AIO_FILDES
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_fildes: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AIO_FILDES put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_lio_opcode [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AIO_LIO_OPCODE
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_lio_opcode: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AIO_LIO_OPCODE put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_nbytes [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_AIO_NBYTES
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_nbytes: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_AIO_NBYTES put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_offset [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_AIO_OFFSET
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_offset: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_AIO_OFFSET put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_reqprio [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AIO_REQPRIO
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_reqprio: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AIO_REQPRIO put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_sigevent [
	"This method was automatically generated"
	^ SigEvent fromHandle: (handle referenceStructAt: OFFSET_AIO_SIGEVENT length: SigEvent byteSize)
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_sigevent: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_AIO_SIGEVENT put: anObject getHandle length: SigEvent byteSize
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> beReadOnly [ 
	read := true.
	write := false.
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> beWriteOnly [
	read := false.
	write := true
]

{ #category : #'as yet unclassified' }
AIOFileHandle >> errorCode [
	^ self ffiCall:#(int aio_error(self))
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> ffiLibraryName [ 
	^ self class ffiLibraryName 
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> initialize [
	super initialize.
	buffer := ExternalAddress allocate: 1024 * 1024.
	buffer autoRelease.
	self aio_buf: buffer.
	self aio_nbytes: 1024 * 1024.
	self aio_offset: 0.
	
]

{ #category : #'aio error' }
AIOFileHandle >> isInProgress [
	^ self errorCode = AIO EINPROGRESS
]

{ #category : #perror }
AIOFileHandle >> perror [
	self perror: 'puto'
]

{ #category : #create }
AIOFileHandle >> perror: aString [
	self ffiCall: #(int perror #(char * aString)) module: LibC
]

{ #category : #read }
AIOFileHandle >> read [
	^ AIO uniqueInstance read: self
]
