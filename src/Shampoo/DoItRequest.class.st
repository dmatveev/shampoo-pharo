"
My instances represent DoIt requests. A DoIt request
evaluates an expession quite and returns only success/failure status to the
client.
"
Class {
	#name : #DoItRequest,
	#superclass : #EvalRequest,
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
DoItRequest class >> is: aString [
            ^aString = 'DoIt'

]

{ #category : #execution }
DoItRequest >> execute [
            [super execute] on: EvalFailure do: [:e | ^OperationalResponse failure: id].
            ^OperationalResponse success: id

]
