Class {
	#name : #FamixOpenstackSourcedEntity,
	#superclass : #FamixOpenstackEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixOpenstackEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]
