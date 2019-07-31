"
#ifndef __ASSEMBLY__
typedef struct {
	unsigned long sig[_NSIG_WORDS];
} sigset_t;

/* not actually used, but required for linux/syscalls.h */
typedef unsigned long old_sigset_t;


"
Class {
	#name : #SigSet,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'LongArray',
		'OFFSET_SIG'
	],
	#category : #'AIO-Signal'
}

{ #category : #'class initialization' }
SigSet class >> fieldsDesc [
"	self rebuildFieldAccessors "
	^ #(LongArray sig ;)
]

{ #category : #'class initialization' }
SigSet class >> initialize [
	LongArray := FFITypeArray ofType: 'long' size: Signal _NSIG_WORDS.
	 
]

{ #category : #'accessing structure variables' }
SigSet >> sig [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFILong size: 1) fromHandle: (handle copyFrom: OFFSET_SIG to: OFFSET_SIG + 3)
]

{ #category : #'accessing structure variables' }
SigSet >> sig: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SIG to: OFFSET_SIG + 3 with: anObject getHandle startingAt: 1
]
