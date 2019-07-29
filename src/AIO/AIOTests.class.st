Class {
	#name : #AIOTests,
	#superclass : #TestCase,
	#category : #AIO
}

{ #category : #tests }
AIOTests >> testFileCanBeOpenForRead [
	| handle |
	handle := AIO uniqueInstance openForRead: 'pharo-local/iceberg/sbragagnolo/aio/file.test' asFileReference .
	self assert: handle aio_fildes > 0.
	 AIO uniqueInstance close: handle aio_fildes.
	
]

{ #category : #tests }
AIOTests >> testFileCanBeOpenForWrite [
	| handle |
	handle := AIO uniqueInstance openForWrite:'pharo-local/iceberg/sbragagnolo/aio/file.test' asFileReference .
	self assert: handle aio_fildes > 0.
	 AIO uniqueInstance close: handle aio_fildes.
	
]

{ #category : #'type tests' }
AIOTests >> testFileHandleStructIs168Bytes [
	self assert: AIOFileHandle byteSize equals: 168.

]

{ #category : #tests }
AIOTests >> testReadFileNonEventCommunication [
	| handle |
	handle := AIO uniqueInstance
		openForRead:
			'/home/santiago/git-repositories/aio/pharo-local/iceberg/sbragagnolo/aio/file.test'
				asFileReference.
	handle aio_sigevent sigev_signo: SigEvent SIGIO.
	handle aio_sigevent sigev_notify: SigEvent SIGEV_SIGNAL.
	handle read.
	[ handle isInProgress ] whileTrue: [ 100 milliSeconds wait ].
	100 milliSecond wait.
	self assert: handle value asString equals: 
 '1
2
3
4
5
6
7
8
9
10'.
]

{ #category : #'type tests' }
AIOTests >> testSigEventSizeEqualsTo64 [
	self assert: SigEvent byteSize equals: 64.

]

{ #category : #'type tests' }
AIOTests >> testSigUnionSizeEqualsTo64Minus2IntsAndOnePointer [
	self assert: SigUnion byteSize equals: 64 - (3 * 4).

]

{ #category : #'type tests' }
AIOTests >> testSigValSizeEqualsToOneIntOrOnePointer [
	self assert: SigVal byteSize equals: 4.

]
