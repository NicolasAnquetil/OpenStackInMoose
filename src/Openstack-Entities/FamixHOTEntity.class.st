Class {
	#name : #FamixHOTEntity,
	#superclass : #MooseEntity,
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixHOTEntity class >> metamodel [

	<generated>
	^ FamixHOTModel metamodel
]
