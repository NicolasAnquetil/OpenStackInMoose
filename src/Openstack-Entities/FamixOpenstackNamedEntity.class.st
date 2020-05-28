Class {
	#name : #FamixOpenstackNamedEntity,
	#superclass : #FamixOpenstackSourcedEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixOpenstackSourcedEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]
