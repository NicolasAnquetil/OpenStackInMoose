Class {
	#name : #FamixHOTAttribute,
	#superclass : #FamixHOTFeature,
	#instVars : [
		'#parentResourceType => FMOne type: #FamixHOTResourceType opposite: #attributes'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixHOTFeature>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTAttribute >> parentResourceType [
	"Relation named: #parentResourceType type: #FamixHOTResourceType opposite: #attributes"

	<generated>
	<container>
	^ parentResourceType
]

{ #category : #accessing }
FamixHOTAttribute >> parentResourceType: anObject [

	<generated>
	parentResourceType := anObject
]

{ #category : #navigation }
FamixHOTAttribute >> parentResourceTypeGroup [
	<generated>
	<navigation: 'ParentResourceType'>
	^ MooseGroup with: self parentResourceType
]

{ #category : #printing }
FamixHOTAttribute >> printOn: aStream [
	^aStream
		nextPutAll: '(att.)' ;
		nextPutAll: self name ;
		yourself
]
