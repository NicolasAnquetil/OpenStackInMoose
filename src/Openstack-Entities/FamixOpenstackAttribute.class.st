Class {
	#name : #FamixOpenstackAttribute,
	#superclass : #FamixOpenstackFonctionality,
	#instVars : [
		'#parentEntity => FMOne type: #FamixOpenstackResource opposite: #attributes'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixOpenstackFonctionality>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackAttribute >> parentEntity [
	"Relation named: #parentEntity type: #FamixOpenstackResource opposite: #attributes"

	<generated>
	<FMComment: 'Resource owning this Attribute'>
	^ parentEntity
]

{ #category : #accessing }
FamixOpenstackAttribute >> parentEntity: anObject [

	<generated>
	parentEntity := anObject
]
