"
My instances hold Transcript outputs. My instances are sent
to all clients when the Transcript have something to print out, there is no
appropriate request.
"
Class {
	#name : #EchoResponse,
	#superclass : #Response,
	#instVars : [
		'text'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
EchoResponse class >> id: anInteger text: aString [
            ^(self id: anInteger)
                text: aString;
                yourself

]

{ #category : #marshalling }
EchoResponse >> asXML [
            ^(super asXML)
                addNode: (ShampooXMLText text: text);
                yourself

]

{ #category : #private }
EchoResponse >> text: aString [
            text := aString

]

{ #category : #private }
EchoResponse >> type [
            ^'Echo'

]
