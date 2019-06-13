"
My instances represent PrintIt requests. A PrinIt request
evaluates an expession and returns its result in a printed form to the client.
"
Class {
	#name : #PrintItRequest,
	#superclass : #EvalRequest,
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
PrintItRequest class >> is: aString [
            ^aString = 'PrintIt'

]

{ #category : #execution }
PrintItRequest >> execute [
            | s |
            [s := super execute] on: EvalFailure do: [:e | ^OperationalResponse failure: id].
            ^PrintItResponse id: id value: s

]
