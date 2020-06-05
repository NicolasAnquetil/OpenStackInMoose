"
Generator class for the Openstack metamodel
"
Class {
	#name : #OpenStackGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'hotEntity',
		'service',
		'resourceType',
		'supportStatus',
		'feature',
		'attribute',
		'range',
		'property',
		'constraint',
		'length',
		'modulo',
		'allowedValues',
		'allowedPattern',
		'customConstraint'
	],
	#category : #'OpenStack-Generator'
}

{ #category : #accessing }
OpenStackGenerator class >> packageName [
	^ #'Openstack-Entities'
]

{ #category : #accessing }
OpenStackGenerator class >> prefix [
	^ #'FamixOpenstack'
]

{ #category : #definition }
OpenStackGenerator >> defineClasses [
	super defineClasses.

	hotEntity := builder newClassNamed: #HotEntity.

	service := builder newClassNamed: #Service.
	resourceType := builder newClassNamed: #ResourceType.
	supportStatus := builder newClassNamed: #SupportStatus.
	feature := builder newClassNamed: #Feature.
	attribute := builder newClassNamed: #Attribute.
	property := builder newClassNamed: #Property.
	constraint := builder newClassNamed: #Constraint.
	range := builder newClassNamed: #Range.
	length := builder newClassNamed: #Length.
	modulo := builder newClassNamed: #Modulo.
	allowedValues := builder newClassNamed: #AllowedValues.
	allowedPattern := builder newClassNamed: #AllowedPattern.
	customConstraint := builder newClassNamed: #CustomConstraint.

]

{ #category : #definition }
OpenStackGenerator >> defineHierarchy [
	super defineHierarchy.

	service --|> hotEntity.
	service  --|> #TNamedEntity.
	supportStatus --|> hotEntity.
	resourceType --|> hotEntity.
	resourceType  --|> #TNamedEntity.
	feature --|> hotEntity.
	feature  --|> #TNamedEntity.
	constraint --|> hotEntity.

	attribute --|> feature.
	property --|> feature.
	
	modulo --|> constraint.
	allowedPattern --|> constraint.
	allowedValues --|> constraint.
	customConstraint --|> constraint.
	range --|> constraint.
	length --|> constraint.

]

{ #category : #definition }
OpenStackGenerator >> defineProperties [
	super defineProperties.

	resourceType property: #description type: #String.
	resourceType property: #abstract type: #Boolean.

	supportStatus property: #message type: #String.
	supportStatus property: #version type: #String.
	supportStatus property: #status type: #String.

	feature property: #description type: #String.
	feature property: #type type: #String.

	property property: #default type: #Object.
	property property: #immutable type: #Boolean.
	property property: #required type: #Boolean.
	property property: #update_allowed type: #Boolean.

	constraint property: #description type: #String.

	range property: #min type: #Number.
	range property: #max type: #Number.

	length property: #min type: #Number.
	length property: #max type: #Number.

	modulo property: #step type: #Number.
	modulo property: #offset type: #Number.
	
	(allowedValues property: #allowed type: #Object)
		multivalued.

	allowedPattern property: #pattern type: #String.

	customConstraint property: #name type: #String.

]

{ #category : #definition }
OpenStackGenerator >> defineRelations [
	super defineRelations.

	(service property: #subServices) <>-* (service property: #parentService).
	(service property: #resourceTypes) <>-* (resourceType property: #parentService).

	(resourceType property: #attributes) <>-* (attribute property: #parentResource).
	(resourceType property: #properties) <>-* (property property: #parentResource).
	(resourceType property: #supportStatus) <>-* (supportStatus property: #resourceType).

	(supportStatus property: #previousStatus) - (supportStatus property: #nextstatus).

	(feature property: #supportStatus) - (supportStatus property: #feature).
	(feature property: #constraints) -* (constraint property: #constrainedFeature).
	(feature property: #entity) *- (resourceType property: #features).
	(feature property: #schemas) -* (property property: #parentFeature).
]
