Class {
	#name : #MTBHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MTBHeaderComponent class >> from: aComponent [
	^ self new
	component: aComponent
	yourself
]

{ #category : #rendering }
MTBHeaderComponent >> component [
	^ component
]

{ #category : #rendering }
MTBHeaderComponent >> component: anObject [ 
	component := anObject
]

{ #category : #rendering }
MTBHeaderComponent >> renderBrandOn: html [
	html tbsNavbar: [ html tbsNavbarBrand 
		url: self application url;
		with: 'TinyBlog' ]
]

{ #category : #rendering }
MTBHeaderComponent >> renderButtonsOn: html [
	self session isLogged
ifTrue: [ self renderSimpleAdminButtonOn: html ]
ifFalse: [ self renderModalLoginButtonOn: html ]

]

{ #category : #rendering }
MTBHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
			self renderBrandOn: html.
			self renderButtonsOn: html
	]]
]

{ #category : #rendering }
MTBHeaderComponent >> renderModalLoginButtonOn: html [
html render: (MTBAuthentificationComponent from: component).
html tbsNavbarButton
tbsPullRight;
attributeAt: 'data-target' put: '#myAuthDialog';
attributeAt: 'data-toggle' put: 'modal';
with: [
html tbsGlyphIcon iconLock.
html text: ' Login' ]

]

{ #category : #rendering }
MTBHeaderComponent >> renderSimpleAdminButtonOn: html [
	html form: [
		html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToAdministrationView ];
		with: [
			html tbsGlyphIcon iconListAlt.
			html text: ' Admin View' ]]


]
