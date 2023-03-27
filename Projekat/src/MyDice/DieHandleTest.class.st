Class {
	#name : #DieHandleTest,
	#superclass : #TestCase,
	#category : #MyDice
}

{ #category : #tests }
DieHandleTest >> testCreationAndAdding [
	|handle|
	handle := DieHandle new
		addDie:(Die withFaces: 6);
		addDie:(Die withFaces: 10);
		yourself.
	self assert: handle diceNumber equals: 2
]

{ #category : #tests }
DieHandleTest >> testCreationWithTheSameDice [
	|handle|
	handle := DieHandle new addDie:(Die withFaces: 6).
	self assert: handle diceNumber equals: 1.
	handle addDie:(Die withFaces: 6).
	self assert: handle diceNumber equals: 2
]

{ #category : #tests }
DieHandleTest >> testMaxValue [
	|handle|
	handle := DieHandle new
		addDie:(Die withFaces: 6);
		addDie:(Die withFaces: 10);
		yourself.
	self assert: handle maxValue  equals: 16
]

{ #category : #tests }
DieHandleTest >> testRoll [
	|handle|
	handle := DieHandle new
		addDie:(Die withFaces: 6);
		addDie:(Die withFaces: 10);
		yourself.
		10 timesRepeat: 
	[self assert: (handle roll between: handle diceNumber  and: handle maxValue)]
]

{ #category : #tests }
DieHandleTest >> testSimpleHandle [
	self assert: 2 D20 diceNumber equals: 2
]

{ #category : #tests }
DieHandleTest >> testSumming [
	self assert: (3 D4 + 2 D6) diceNumber equals: 5
]
