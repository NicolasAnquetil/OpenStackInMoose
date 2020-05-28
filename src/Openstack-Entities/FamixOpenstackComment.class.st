Class {
	#name : #FamixOpenstackComment,
	#superclass : #FamixOpenstackSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackComment class >> annotation [

	<FMClass: #Comment super: #FamixOpenstackSourcedEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]
