Class {
	#name : #ShampooLoginTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'login',
		'server',
		'info'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooLoginTest class >> loginSample [
	^'<request id="25" type="Login">
      <creds login="dmitry" magic="0bf2f198be57c763af1c9a6f2359fdc8" />
  </request>'

]

{ #category : #'as yet unclassified' }
ShampooLoginTest >> setUp [
	"Magic is 1337"
            info := AuthInfo login: 'dmitry' pass: 'pass'.
            login := self requestFrom: ShampooLoginTest loginSample.

]

{ #category : #'as yet unclassified' }
ShampooLoginTest >> testCreds [
	self should: [login creds = (info with: 1337)]

]
