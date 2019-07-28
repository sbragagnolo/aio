Class {
	#name : #AIOTests,
	#superclass : #TestCase,
	#category : #AIO
}

{ #category : #tests }
AIOTests >> testFileCanBeOpenForRead [
	| handle |
	handle := AIO uniqueInstance openForRead: '/Users/sbragagn/git-repositories/aio_example/file.test' asFileReference .
	self assert: handle aio_fildes > 0.
	 AIO uniqueInstance close: handle aio_fildes.
	
]

{ #category : #tests }
AIOTests >> testFileCanBeOpenForWrite [
	| handle |
	handle := AIO uniqueInstance openForWrite: '/Users/sbragagn/git-repositories/aio_example/file.test' asFileReference .
	self assert: handle aio_fildes > 0.
	 AIO uniqueInstance close: handle aio_fildes.
	
]
