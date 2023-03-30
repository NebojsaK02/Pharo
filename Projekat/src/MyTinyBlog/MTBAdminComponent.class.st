Class {
	#name : #MTBAdminComponent,
	#superclass : #MTBScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #accessing }
MTBAdminComponent >> children [
^ super children copyWith: self report
]

{ #category : #initialization }
MTBAdminComponent >> createHeaderComponent [
	^ MTBAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
MTBAdminComponent >> goToPostListView [
	self answer
]

{ #category : #accessing }
MTBAdminComponent >> initialize [
super initialize.
self report: (MTBPostsReport from: self blog)
]

{ #category : #'as yet unclassified' }
MTBAdminComponent >> renderContentOn: html [
super renderContentOn: html.
html tbsContainer: [
html heading: 'Blog Admin'.
html horizontalRule.
html render: self report ]
]

{ #category : #accessing }
MTBAdminComponent >> report [
	^ report
]

{ #category : #accessing }
MTBAdminComponent >> report: aReport [
	report:=aReport
]
