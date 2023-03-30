Class {
	#name : #MTBPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'as yet unclassified' }
MTBPostsReport class >> filteredDescriptionsFrom: aBlogPost [
^ aBlogPost magritteDescription
select: [ :each | #(title category date) includes: each accessor
selector ]

]

{ #category : #'instance creation' }
MTBPostsReport class >> from: aBlog [
| report blogPosts |
blogPosts := aBlog allBlogPosts.
report := self rows: blogPosts description: (self
filteredDescriptionsFrom: blogPosts anyOne).
report blog: aBlog.
report addColumn: (MACommandColumn new
addCommandOn: report selector: #viewPost: text: 'View';
yourself;
addCommandOn: report selector: #editPost: text: 'Edit';
yourself;
addCommandOn: report selector: #deletePost: text: 'Delete';
yourself).
^ report
]

{ #category : #'as yet unclassified' }
MTBPostsReport >> addPost [
| post |
post := self call: (self renderAddPostForm: MTBPost new).
post
ifNotNil: [ blog writeBlogPost: post.
self refreshReport ]

]

{ #category : #accessing }
MTBPostsReport >> blog [
	^ blog
]

{ #category : #accessing }
MTBPostsReport >> blog: aMTBBlog [
	blog:=aMTBBlog
]

{ #category : #'as yet unclassified' }
MTBPostsReport >> deletePost: aPost [
(self confirm: 'Do you want remove this post ?')
ifTrue: [ blog removeBlogPost: aPost.
self refreshReport ]
]

{ #category : #rendering }
MTBPostsReport >> editPost: aPost [
| post |
post := self call: (self renderEditPostForm: aPost).
post ifNotNil: [ blog save ]
]

{ #category : #'as yet unclassified' }
MTBPostsReport >> refreshReport [
self rows: blog allBlogPosts.
self refresh.
]

{ #category : #rendering }
MTBPostsReport >> renderAddPostForm: aPost [
^ aPost asComponent
addDecoration: (TBSMagritteFormDecoration buttons: { #save
-> 'Add post' . #cancel -> 'Cancel'});
yourself

]

{ #category : #rendering }
MTBPostsReport >> renderContentOn: html [
html tbsGlyphIcon iconPencil.
html anchor
callback: [ self addPost ];
with: 'Add post'.
super renderContentOn: html
]

{ #category : #rendering }
MTBPostsReport >> renderEditPostForm: aPost [
^ aPost asComponent addDecoration: (
TBSMagritteFormDecoration buttons: {
#save -> 'Save post'.
#cancel -> 'Cancel'});
yourself
]

{ #category : #rendering }
MTBPostsReport >> renderViewPostForm: aPost [
^ aPost asComponent
addDecoration: (TBSMagritteFormDecoration buttons: { #cancel
-> 'Back' });
readonly: true;
yourself

]

{ #category : #rendering }
MTBPostsReport >> viewPost: aPost [
self call: (self renderViewPostForm: aPost)
]
