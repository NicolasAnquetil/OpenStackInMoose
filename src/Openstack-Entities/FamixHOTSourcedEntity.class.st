Class {
	#name : #FamixHOTSourcedEntity,
	#superclass : #FamixHOTEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixHOTEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]
