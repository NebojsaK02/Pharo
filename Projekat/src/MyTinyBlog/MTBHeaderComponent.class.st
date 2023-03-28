Class {
	#name : #MTBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'MyTinyBlog-Components'
}

{ #category : #rendering }
MTBHeaderComponent >> renderBrandOn: html [
	html tbsNavbar: [ html tbsNavbarBrand 
		url: self application url;
		with: 'TinyBlog' ]
]

{ #category : #rendering }
MTBHeaderComponent >> renderContentOn: html [ 
	html tbsNavbar beDefault ; with: [ html tbsContainer: 
		[ self renderBrandOn: html  ] ]
]
