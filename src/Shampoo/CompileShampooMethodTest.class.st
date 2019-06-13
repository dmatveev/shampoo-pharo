Class {
	#name : #CompileShampooMethodTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'compileMethod'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
CompileShampooMethodTest >> compileMethodSample [
	^'<request id="80" type="CompileMethod" namespace="ShampooSamples" class="SampleClassD" side="instance">
    sampleCompiledMethod: anInteger
        ^anInteger * 4 - 2
  </request>'

]

{ #category : #'as yet unclassified' }
CompileShampooMethodTest >> setUp [
	compileMethod := self requestFrom: self compileMethodSample

]

{ #category : #'as yet unclassified' }
CompileShampooMethodTest >> testCompileMethod [
	| r value |
            r := compileMethod execute.
            value := SampleClassD new sampleCompiledMethod: 11.
            self should: [value = 42]

]
