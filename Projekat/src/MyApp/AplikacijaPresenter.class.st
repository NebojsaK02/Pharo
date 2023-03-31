Class {
	#name : #AplikacijaPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'forma',
		'rezultat',
		'tabela'
	],
	#category : #MyApp
}

{ #category : #specs }
AplikacijaPresenter class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		position: (StandardFonts defaultFont widthOfString: 'M') * 35;
		add: #forma;
		add: #rezultat;
		yourself
]

{ #category : #accessing }
AplikacijaPresenter >> forma [
^ forma
]

{ #category : #accessing }
AplikacijaPresenter >> forma: anObject [
forma:=anObject 
]

{ #category : #initialization }
AplikacijaPresenter >> initialize [  
	self model: AplikacijaModel new.
	super initialize
]

{ #category : #'as yet unclassified' }
AplikacijaPresenter >> initializePresenters [
	forma := (self instantiate: AplikacijaLabelledContainer )
		label: 'FORMA';
		subwidget: (self instantiate: AplikacijaStandalonePresenter on: self announcingObject).
	rezultat := (self instantiate: AplikacijaLabelledContainer )
		label: 'REZULTAT';
		subwidget: (tabela := self newTable).

	tabela
		addColumn: (SpStringTableColumn title: 'Naziv Kolone' evaluated: #key);
		addColumn: (SpStringTableColumn title: 'Vrednost Kolone' evaluated: #value);
		items: self model elements;
		beResizable.

	self focusOrder
		add: forma;
		add: tabela
]

{ #category : #'as yet unclassified' }
AplikacijaPresenter >> modelChanged [
tabela items: self model elements
]

{ #category : #accessing }
AplikacijaPresenter >> rezultat [
^ rezultat
]

{ #category : #accessing }
AplikacijaPresenter >> rezultat: anObject [
rezultat:=anObject 
]

{ #category : #accessing }
AplikacijaPresenter >> tabela [
^ tabela
]

{ #category : #accessing }
AplikacijaPresenter >> tabela: anObject [
tabela:=anObject 
]
