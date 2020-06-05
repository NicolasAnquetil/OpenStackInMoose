Class {
	#name : #FamixHOTAttribute,
	#superclass : #FamixHOTFeature,
	#instVars : [
		'#parentResource => FMOne type: #FamixHOTResourceType opposite: #attributes'
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
FamixHOTAttribute >> parentResource [
	"Relation named: #parentResource type: #FamixHOTResourceType opposite: #attributes"

	<generated>
	<container>
	^ parentResource
]

{ #category : #accessing }
FamixHOTAttribute >> parentResource: anObject [

	<generated>
	parentResource := anObject
]

{ #category : #navigation }
FamixHOTAttribute >> parentResourceGroup [
	<generated>
	<navigation: 'ParentResource'>
	^ MooseGroup with: self parentResource
]
