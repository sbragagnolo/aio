Class {
	#name : #SignalTests,
	#superclass : #TestCase,
	#category : #'AIO-Signal'
}

{ #category : #constants }
SignalTests >> testConstantValueSIGABRT [
	self assert: Signal SIGABRT equals: 6.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGALRM [
	self assert: Signal SIGALRM equals: 14.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGBUS [
	self assert: Signal SIGBUS equals: 7.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGCHLD [
	self assert: Signal SIGCHLD equals: 17.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGCONT [
	self assert: Signal SIGCONT equals: 18.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGFPE [
	self assert: Signal SIGFPE equals: 8.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGHUP [
	self assert: Signal SIGHUP equals: 1.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGILL [
	self assert: Signal SIGILL equals: 4.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGINT [
	self assert: Signal SIGINT equals: 2.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGIO [
	self assert: Signal SIGIO equals: 29.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGIOT [
	self assert: Signal SIGIOT equals: 6.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGKILL [
	self assert: Signal SIGKILL equals: 9.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGLOST [
	self assert: Signal SIGLOST equals: 29.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGPIPE [
	self assert: Signal SIGPIPE equals: 13.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGPOLL [
	self assert: Signal SIGPOLL equals: Signal SIGIO.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGPROF [
	self assert: Signal SIGPROF equals: 27.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGPWR [
	self assert: Signal SIGPWR equals: 30.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGQUIT [
	self assert: Signal SIGQUIT equals: 3.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGRTMAX [
	self assert: Signal SIGRTMAX equals: Signal _NSIG.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGRTMIN [
	self assert: Signal SIGRTMIN equals: 32.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGSEGV [
	self assert: Signal SIGSEGV equals: 11.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGSTKFLT [
	self assert: Signal SIGSTKFLT equals: 16.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGSTOP [
	self assert: Signal SIGSTOP equals: 19.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGSYS [
	self assert: Signal SIGSYS equals: 31.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGTERM [
	self assert: Signal SIGTERM equals: 15.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGTRAP [
	self assert: Signal SIGTRAP equals: 5.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGTSTP [
	self assert: Signal SIGTSTP equals: 20.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGTTIN [
	self assert: Signal SIGTTIN equals: 21.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGTTOU [
	self assert: Signal SIGTTOU equals: 22.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGUNUSED [
	self assert: Signal SIGUNUSED equals: 31.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGURG [
	self assert: Signal SIGURG equals: 23.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGUSR1 [
	self assert: Signal SIGUSR1 equals: 10.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGUSR2 [
	self assert: Signal SIGUSR2 equals: 12.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGVTALRM [
	self assert: Signal SIGVTALRM equals: 26.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGWINCH [
	self assert: Signal SIGWINCH equals: 28.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGXCPU [
	self assert: Signal SIGXCPU equals: 24.
]

{ #category : #constants }
SignalTests >> testConstantValueSIGXFSZ [
	self assert: Signal SIGXFSZ equals: 25.
]

{ #category : #'type tests' }
SignalTests >> testSigEventSizeEqualsTo64 [
	self assert: SigEvent byteSize equals: 64.

]

{ #category : #'type tests' }
SignalTests >> testSigUnionSizeEqualsTo64Minus2IntsAndOnePointer [
	self assert: SigInnerAnonymUnion byteSize equals: 64 - (3 * 4).

]

{ #category : #'type tests' }
SignalTests >> testSigValSizeEqualsToOneIntOrOnePointer [
	self assert: SigVal byteSize equals: 4.

]

{ #category : #'type tests' }
SignalTests >> testSignalConstants [
	self assert: Signal SIGHUP equals: 1. 
	
]
