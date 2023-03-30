Class {
	#name : #MTBAdminHeaderComponent,
	#superclass : #MTBHeaderComponent,
	#category : #'MyTinyBlog-Components'
}

{ #category : #rendering }
MTBAdminHeaderComponent >> renderButtonsOn: html [
	html form: [
self renderDisconnectButtonOn: html.
self renderPublicViewButtonOn: html ]
]

{ #category : #rendering }
MTBAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
tbsPullRight;
callback: [ self session reset ];
with: [
html text: 'Disconnect '.
html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
MTBAdminHeaderComponent >> renderPublicViewButtonOn: html [
self session isLogged ifTrue: [
html tbsNavbarButton
tbsPullRight;
callback: [ component goToPostListView ];
with: [
html tbsGlyphIcon iconEyeOpen.
html text: ' Public View' ]]
]
