Class {
	#name : #AIO,
	#superclass : #LibC,
	#category : #AIO
}

{ #category : #access }
AIO class >> EINPROGRESS [
	^ 36
]

{ #category : #'as yet unclassified' }
AIO class >> O_ACCMODE [
	^ 16r0003
]

{ #category : #'as yet unclassified' }
AIO class >> O_CREAT [
	^ 16r0200
]

{ #category : #'as yet unclassified' }
AIO class >> O_EXCL [      
	^ 16r0800
	
]

{ #category : #'as yet unclassified' }
AIO class >> O_NONBLOCK [        
	^ 16r0004

]

{ #category : #'as yet unclassified' }
AIO class >> O_RDONLY [        
	^ 16r0000

]

{ #category : #'as yet unclassified' }
AIO class >> O_RDWR [        
	^ 16r0002
]

{ #category : #'as yet unclassified' }
AIO class >> O_WRONLY [        
	^ 16r0001
]

{ #category : #'meta-object-protocol' }
AIO >> close: fd [
	^ self ffiCall: #(int close(int fd))
]

{ #category : #'meta-object-protocol' }
AIO >> mem: ptr set: value size: n [
	^ self ffiCall: #(void *memset(void *ptr, const int value, size_t n))
]

{ #category : #'meta-object-protocol' }
AIO >> openFile: pathname option: flags [ 
	^ self ffiCall: #(int open(const char *pathname, int flags))
]

{ #category : #'meta-object-protocol' }
AIO >> openFile: pathname option: flags  mode: mode [
	^ self ffiCall: #(int open(const char *pathname, int flags, uint16 mode))
]

{ #category : #open }
AIO >> openForRead: aFileReference [
	| handle |
	handle := AIOFileHandle new.
	handle
		aio_fildes: (self openFile: aFileReference fullName option: AIO O_RDONLY);
		beReadOnly.
	^ handle
]

{ #category : #'meta-object-protocol' }
AIO >> openForWrite: aFileReference [
	| handle |
	handle := AIOFileHandle new.
	handle
		aio_fildes: (self openFile: aFileReference fullName option: AIO O_WRONLY);
		beWriteOnly.
	^ handle
]

{ #category : #'meta-object-protocol' }
AIO >> read: hand [
	^ self ffiCall: #(void aio_read #(AIOFileHandle * hand))
]
