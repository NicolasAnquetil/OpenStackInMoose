Class {
	#name : #FamixOpenstackAttribute,
	#superclass : #FamixOpenstackFeature,
	#instVars : [
		'#parentResource => FMOne type: #FamixOpenstackResourceType opposite: #attributes'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixOpenstackFeature>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackAttribute >> parentResource [
	"Relation named: #parentResource type: #FamixOpenstackResourceType opposite: #attributes"

	<generated>
	<container>
	^ parentResource
]

{ #category : #accessing }
FamixOpenstackAttribute >> parentResource: anObject [

	<generated>
	parentResource := anObject
]

{ #category : #navigation }
FamixOpenstackAttribute >> parentResourceGroup [
	<generated>
	<navigation: 'ParentResource'>
	^ MooseGroup with: self parentResource
]
