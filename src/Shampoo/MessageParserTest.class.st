Class {
	#name : #MessageParserTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'justParser',
		'overParser',
		'underParser',
		'brokenParser'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
MessageParserTest >> happy [
	^'Content-Length: 2', String crlf,
                String crlf,
                ':)'

]

{ #category : #'as yet unclassified' }
MessageParserTest >> sad [
	^'Content-Length: 2', String crlf,
                String crlf,
                ':('

]

{ #category : #'as yet unclassified' }
MessageParserTest >> setUp [
	justParser := MessageParser new.
            overParser := MessageParser new.
            underParser := MessageParser new.
            brokenParser := MessageParser new.

]

{ #category : #'as yet unclassified' }
MessageParserTest >> testBroken [
	| msg part1 part2 r |
            msg := self sad.
            part1 := msg copyFrom: 1 to: 7.
            part2 := msg copyFrom: 8.
            r := brokenParser process: part1.
            self should: [r isEmpty].
            r := brokenParser process: part2.
            self should: [r first = ':(']

]

{ #category : #'as yet unclassified' }
MessageParserTest >> testOver [
	| msg r |
            msg := self happy, self sad.
            r := overParser process: msg.
            self
                should: [r first = ':)'];
                should: [r second = ':(']

]

{ #category : #'as yet unclassified' }
MessageParserTest >> testSimple [
	| msg r |
            msg := self happy.
            r := justParser process: msg.
            self should: [r first = ':)']

]

{ #category : #'as yet unclassified' }
MessageParserTest >> testUnder [
	| msg r |
            msg := self happy, (self sad copyFrom: 1 to: 7).
            r := underParser process: msg.
            self
                should: [r first = ':)'];
                should: [r size = 1]

]
