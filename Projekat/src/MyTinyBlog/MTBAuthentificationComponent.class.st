Class {
	#name : #MTBAuthentificationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MTBAuthentificationComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself

]

{ #category : #accessing }
MTBAuthentificationComponent >> account [
	^ account
]

{ #category : #accessing }
MTBAuthentificationComponent >> account: anObject [
	account := anObject
]

{ #category : #accessing }
MTBAuthentificationComponent >> component [
	^ component

]

{ #category : #accessing }
MTBAuthentificationComponent >> component: anObject [
	component := anObject

]

{ #category : #accessing }
MTBAuthentificationComponent >> password [
	^ password
]

{ #category : #accessing }
MTBAuthentificationComponent >> password: anObject [
	password := anObject
]

{ #category : #rendering }
MTBAuthentificationComponent >> renderAccountFieldOn: html [
html
tbsFormGroup: [ html label with: 'Account'.
html textInput
tbsFormControl;
attributeAt: 'autofocus' put: 'true';
callback: [ :value | account := value ];
value: account ]

]

{ #category : #rendering }
MTBAuthentificationComponent >> renderBodyOn: html [
html
tbsModalBody: [
html tbsForm: [
self renderAccountFieldOn: html.
self renderPasswordFieldOn: html.
html tbsModalFooter: [ self renderButtonsOn: html ]
] ]
]

{ #category : #rendering }
MTBAuthentificationComponent >> renderButtonsOn: html [
html tbsButton
attributeAt: 'type' put: 'button';
attributeAt: 'data-dismiss' put: 'modal';
beDefault;
value: 'Cancel'.
html tbsSubmitButton
bePrimary;
callback: [ self validate ];
value: 'SignIn'
]

{ #category : #rendering }
MTBAuthentificationComponent >> renderContentOn: html [
html tbsModal
id: 'myAuthDialog';
with: [
html tbsModalDialog: [
html tbsModalContent: [
self renderHeaderOn: html.
self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
MTBAuthentificationComponent >> renderHeaderOn: html [
html
tbsModalHeader: [
html tbsModalCloseIcon.
html tbsModalTitle
level: 4;
with: 'Authentication' ]
]

{ #category : #rendering }
MTBAuthentificationComponent >> renderPasswordFieldOn: html [
html tbsFormGroup: [
html label with: 'Password'.
html passwordInput
tbsFormControl;
callback: [ :value | password := value ];
value: password ]

]

{ #category : #rendering }
MTBAuthentificationComponent >> validate [
^ component tryConnectionWithLogin: self account andPassword: self
password

]
