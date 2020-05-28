Class {
	#name : #FamixOpenstackEntity,
	#superclass : #MooseEntity,
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixOpenstackEntity class >> metamodel [

	<generated>
	^ FamixOpenstackModel metamodel
]
