Class {
	#name : #FamixOpenstackFonctionality,
	#superclass : #FamixOpenstackOpenStackEntity,
	#instVars : [
		'#referredEntity => FMOne type: #FamixOpenstackComplexEntity opposite: #referringFunctionalities'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackFonctionality class >> annotation [

	<FMClass: #Fonctionality super: #FamixOpenstackOpenStackEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackFonctionality >> referredEntity [
	"Relation named: #referredEntity type: #FamixOpenstackComplexEntity opposite: #referringFunctionalities"

	<generated>
	<FMComment: 'Optional ComplexEntity contained in this functionality'>
	^ referredEntity
]

{ #category : #accessing }
FamixOpenstackFonctionality >> referredEntity: anObject [

	<generated>
	referredEntity := anObject
]
