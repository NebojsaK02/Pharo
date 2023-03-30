Class {
	#name : #MTBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
MTBPost class >> title: aTitle text: aText [
^ self new 
	title: aTitle; 
	text: aText;
	yourself
]

{ #category : #'as yet unclassified' }
MTBPost class >> title: aTitle text: aText category: aCategory [
^ (self title: aTitle text: aText) 
	category: aCategory;
	yourself
]

{ #category : #'as yet unclassified' }
MTBPost class >> unclassifiedTag [
^ 'Unclassified'
]

{ #category : #accessing }
MTBPost >> beVisible [ 
self visible: true
]

{ #category : #accessing }
MTBPost >> category [ 
^ category
]

{ #category : #accessing }
MTBPost >> category: anObject [  
category := anObject 
]

{ #category : #accessing }
MTBPost >> date [ 
^ date
]

{ #category : #accessing }
MTBPost >> date: aDate [ 
date := aDate
]

{ #category : #'magritte descriptions' }
MTBPost >> descriptionCategory [
<magritteDescription>
^ MAStringDescription new
label: 'Category';
priority: 300;
accessor: #category;
comment: 'Unclassified if empty';
componentClass: TBSMagritteTextInputComponent;
yourself
]

{ #category : #'magritte descriptions' }
MTBPost >> descriptionContainer [
<magritteContainer>
^ super descriptionContainer
componentRenderer: TBSMagritteFormRenderer;
yourself

]

{ #category : #'acessing-magritte' }
MTBPost >> descriptionDate [
<magritteDescription>
^ MADateDescription new
label: 'Date';
priority: 400;
accessor: #date;
beRequired;
yourself

]

{ #category : #'magritte descriptions' }
MTBPost >> descriptionText [
<magritteDescription>
^ MAMemoDescription new
label: 'Text';
priority: 200;
accessor: #text;
beRequired;
requiredErrorMessage: 'A blog post must contain a text.';
comment: 'Please enter a text';
componentClass: TBSMagritteTextAreaComponent;
yourself

]

{ #category : #'magritte descriptions' }
MTBPost >> descriptionTitle [
<magritteDescription>
^ MAStringDescription new
label: 'Title';
priority: 100;
accessor: #title;
requiredErrorMessage: 'A blog post must have a title.';
comment: 'Please enter a title';
componentClass: TBSMagritteTextInputComponent;
beRequired;
yourself

]

{ #category : #'magritte descriptions' }
MTBPost >> descriptionVisible [
<magritteDescription>
^ MABooleanDescription new
checkboxLabel: 'Visible';
priority: 500;
accessor: #visible;
componentClass: TBSMagritteCheckboxComponent;
beRequired;
yourself

]

{ #category : #initialization }
MTBPost >> initialize [
super initialize.
self category: MTBPost unclassifiedTag.
self date: Date today.
self notVisible
]

{ #category : #testing }
MTBPost >> isUnclassified [
^ self category = MTBPost unclassifiedTag 
]

{ #category : #testing }
MTBPost >> isVisible [ 
^ self visible 
]

{ #category : #accessing }
MTBPost >> notVisible [ 
self visible: false
]

{ #category : #accessing }
MTBPost >> text [ 
^ text
]

{ #category : #accessing }
MTBPost >> text: aString [  
text := aString
]

{ #category : #accessing }
MTBPost >> title [ 
^ title
]

{ #category : #accessing }
MTBPost >> title: aString [ 
title := aString
]

{ #category : #accessing }
MTBPost >> visible [ 
^ visible
]

{ #category : #accessing }
MTBPost >> visible: aBoolean [
visible := aBoolean 
]
