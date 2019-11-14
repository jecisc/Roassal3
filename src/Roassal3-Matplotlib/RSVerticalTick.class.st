Class {
	#name : #RSVerticalTick,
	#superclass : #RSAbstractTick,
	#category : #'Roassal3-Matplotlib'
}

{ #category : #rendering }
RSVerticalTick >> renderIn: canvas [

	| scale aTick e1 e2 lbl |
	scale := self createYScale.
	(chart minValueY to: chart maxValueY count: numberOfTicks) do: [ :i |
		e1 := RSBox new size: 1.
		e2 := RSBox new size: 1.
		aTick := RSLine new from: e1; to: e2.
		aTick attachPoint: (RSCenteredAttachPoint new).
		canvas add: e1; add: e2; add: aTick.
		e1 translateTo: 0 @ (scale scale: i).
		e2 translateTo: self tickSize negated @ (scale scale: i).
		
		shouldHaveLabels ifTrue: [ 
			lbl := self createLabelFor: i.
			canvas add: lbl.
			RSLocation new outer; left; move: lbl on: e2 ]
		]
	
]