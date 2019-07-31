Class {
	#name : #CLangDumpParser,
	#superclass : #Object,
	#category : #'AIO-aio'
}

{ #category : #'as yet unclassified' }
CLangDumpParser >> countIndentation: aLine [
	| stream count |
	stream := aLine readStream.
	count := 0.
	[ stream atEnd not and:[ stream next = Character space ] ] whileTrue: [  count := count + 1 ].
	^ count
]

{ #category : #'as yet unclassified' }
CLangDumpParser >> preparse: aStream [
	| line preparsed lastIndentation |
	preparsed := '' writeStream.
	lastIndentation := 0.
	[ aStream atEnd ]
		whileFalse: [ 
			| indentation | 
			line := self removeWeirdos: aStream nextLine.
			indentation := self countIndentation: line.
			indentation > lastIndentation ifTrue: [ 
				
				indentation timesRepeat: [ preparsed nextPut: Character space ].
				preparsed nextPut: ${.
				preparsed nextPutAll: String crlf. 
				lastIndentation := indentation.
			 ].
			indentation < lastIndentation ifTrue:[
				indentation timesRepeat: [ preparsed nextPut: Character space ].
				preparsed nextPut: $}.
				preparsed nextPutAll: String crlf. 
				lastIndentation := indentation.
			].
			preparsed nextPutAll: line.
			preparsed nextPutAll: String crlf. 
	 ].
	^ preparsed
]

{ #category : #'as yet unclassified' }
CLangDumpParser >> removeWeirdos: aLine [
	| line |
	line := aLine copyReplaceAll: '|' with: ''.
	line := line copyReplaceAll: '`' with: ''.
	line := line copyReplaceAll: '-' with: ''.
	^ line
]
