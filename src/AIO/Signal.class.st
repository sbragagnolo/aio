"
Signal works as an oracle for dealing with Signal related code. 
"
Class {
	#name : #Signal,
	#superclass : #Object,
	#instVars : [
		'code',
		'event'
	],
	#category : #'AIO-Signal'
}

{ #category : #constants }
Signal class >> SIGABRT [
	^6.
]

{ #category : #constants }
Signal class >> SIGALRM [
	^14.
]

{ #category : #constants }
Signal class >> SIGBUS [
	^7.
]

{ #category : #constants }
Signal class >> SIGCHLD [
	^17.
]

{ #category : #constants }
Signal class >> SIGCONT [
	^18.
]

{ #category : #constants }
Signal class >> SIGFPE [
	^8.
]

{ #category : #constants }
Signal class >> SIGHUP [
	^1.
]

{ #category : #constants }
Signal class >> SIGILL [
	^4.
]

{ #category : #constants }
Signal class >> SIGINT [
	^2.
]

{ #category : #constants }
Signal class >> SIGIO [
	^29.
]

{ #category : #constants }
Signal class >> SIGIOT [
	^6.
]

{ #category : #constants }
Signal class >> SIGKILL [
	^9.
]

{ #category : #constants }
Signal class >> SIGLOST [
	^29.
]

{ #category : #constants }
Signal class >> SIGPIPE [
	^13.
]

{ #category : #constants }
Signal class >> SIGPOLL [
	^self SIGIO.
]

{ #category : #constants }
Signal class >> SIGPROF [
	^27.
]

{ #category : #constants }
Signal class >> SIGPWR [
	^30.
]

{ #category : #constants }
Signal class >> SIGQUIT [
	^3.
]

{ #category : #constants }
Signal class >> SIGRTMAX [
	^self _NSIG.
]

{ #category : #constants }
Signal class >> SIGRTMIN [
	^32.
]

{ #category : #constants }
Signal class >> SIGSEGV [
	^11.
]

{ #category : #constants }
Signal class >> SIGSTKFLT [
	^16.
]

{ #category : #constants }
Signal class >> SIGSTOP [
	^19.
]

{ #category : #constants }
Signal class >> SIGSYS [
	^31.
]

{ #category : #constants }
Signal class >> SIGTERM [
	^15.
]

{ #category : #constants }
Signal class >> SIGTRAP [
	^5.
]

{ #category : #constants }
Signal class >> SIGTSTP [
	^20.
]

{ #category : #constants }
Signal class >> SIGTTIN [
	^21.
]

{ #category : #constants }
Signal class >> SIGTTOU [
	^22.
]

{ #category : #constants }
Signal class >> SIGUNUSED [
	^31.
]

{ #category : #constants }
Signal class >> SIGURG [
	^23.
]

{ #category : #constants }
Signal class >> SIGUSR1 [
	^10.
]

{ #category : #constants }
Signal class >> SIGUSR2 [
	^12.
]

{ #category : #constants }
Signal class >> SIGVTALRM [
	^26.
]

{ #category : #constants }
Signal class >> SIGWINCH [
	^28.
]

{ #category : #constants }
Signal class >> SIGXCPU [
	^24.
]

{ #category : #constants }
Signal class >> SIGXFSZ [
	^25.
]

{ #category : #constants }
Signal class >> _NSIG [
	^ 64
]

{ #category : #constants }
Signal class >> _NSIG_WORDS [
	^ self _NSIG / self __BITS_PER_LONG
]

{ #category : #constants }
Signal class >> __BITS_PER_LONG [
	self flag: #ShouldLoadFromArchitecture.
	^ 64
]
