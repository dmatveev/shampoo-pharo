Class {
	#name : #ShampooClassTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'class',
		'nilSubclass',
		'classSide',
		'r',
		'nilr',
		'classr'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooClassTest >> classSample [
	^'<request id="15" type="Class" namespace="ShampooSamples"
               class="SampleClassA" side="instance"/>'

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> classSideSample [
	^'<request id="15" type="Class" namespace="ShampooSamples"
               class="SampleClassA" side="class"/>'

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> nilSubclassSample [
	^'<request id="15" type="Class" namespace="ShampooSamples"
               class="SampleClassE" side="instance"/>'

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> performClassVarsTestFor: aResponse [
	| vars |
            vars := aResponse items at: 'classvar'.
            self should: [vars includes: 'One'];
                 should: [vars includes: 'Two'];
                 should: [vars includes: 'Three']

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> setUp [
	class := self requestFrom: self classSample.
            nilSubclass := self requestFrom: self nilSubclassSample.
            classSide := self requestFrom: self classSideSample.
            r := class execute.
            nilr := nilSubclass execute.
            classr := classSide execute

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> testClassSideClassvars [
	self performClassVarsTestFor: classr

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> testClassSideInstvars [
	| vars |
            vars := classr items at: 'instvar'.
            self should: [vars includes: 'd'];
                 shouldnt: [vars includes: 'a'];
                 shouldnt: [vars includes: 'b'];
                 shouldnt: [vars includes: 'c']

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> testClassvars [
	self performClassVarsTestFor: r

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> testInstvars [
	| vars |
            vars := r items at: 'instvar'.
            self should: [vars includes: 'a'];
                 should: [vars includes: 'b'];
                 should: [vars includes: 'c']

]

{ #category : #'as yet unclassified' }
ShampooClassTest >> testSuperclass [
	self should: [(r attrs at: 'superclass') = 'Object'];
                 should: [(nilr attrs at: 'superclass') = 'ProtoObject']

]
