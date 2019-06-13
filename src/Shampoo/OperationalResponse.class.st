"
My instances are used to hold a success/failure status of an operation. An operation is usually a result of a request execution.
"
Class {
	#name : #OperationalResponse,
	#superclass : #Response,
	#instVars : [
		'success'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
OperationalResponse class >> failure: anInteger [
            ^(OperationalResponse id: anInteger)
                success: false;
                yourself
]

{ #category : #'instance creation' }
OperationalResponse class >> success: anInteger [
            ^(OperationalResponse id: anInteger)
                success: true;
                yourself

]

{ #category : #marshalling }
OperationalResponse >> asXML [
            ^(super asXML)
                addAttribute: 'status' value: self statusString;
                yourself

]

{ #category : #accessors }
OperationalResponse >> statusString [
            ^success ifTrue: ['success'] ifFalse: ['failure']

]

{ #category : #'*Shampoo-Tests' }
OperationalResponse >> success [
            ^success

]

{ #category : #private }
OperationalResponse >> success: aBoolean [
            success := aBoolean

]

{ #category : #private }
OperationalResponse >> type [
            ^'OperationalResponse'

]
