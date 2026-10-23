(define(domain avatar-journey))

(:requirements 
:strips 
:typing 
:negative-preconditions
:numeric-fluents
:conditional-effects)

(:types

location bending mission threat
)




(: predicates

(at-avatar ?l - location)
(at-spirit-animal ?l - location)

(connected ?from ?to - location)
(blocked-by ?t - threat ?from ?to - location)

(safe-location ?l - location)
(teacher-at ?b - bending ?l - location)
(learned ?b - bending)
(next-to-learn ?b - bending)
(next-in-order ?c ?n - bending)

(mission-at ?m - mission ?l - location)
(mission-requires ?m - mission ?b - bending)
(mission-done ?m - mission)

(threat-at ?t - threat ?l - location)
(fight-requires ?t - threat ?b - bending)
(threat-defeated ?t - threat)
)

(:functions

(avatar-energy)
(spirit-animal-energy)
(max-avatar-energy)
(max-spirit-animal-energy)
)

;Travelling from location to location


(:action travel
:parameters (?from ?to - location)
:preconditions(and
(at-avatar ?from)
(at-spirit-animal ?from)
(connected ?from ?to)
(>= (spirit-animal-energy) 2)


(forall (?t - threat)
(not (blocked-by ?t ?from ?to)
))

:effect (and
(not (at-avatar ?from))
(not (at-spirit-animal ?from))
(at-avatar ?to)
(at-spirit-animal ?to)
(decrease (spirit-animal-energy)2)

)
)

(:action Train 
:parameters(?b - bending ?l - location)
:precondition (and
(at-avatar ?l)
(at-spirit-animal ?l)
(teacher-at ?b ?l) 
(next-to-learn ?b)
(not(learned ?b))
(>=(avatar-bending)3)
)
:effect (and
(learned ?b)
(not(next-to-learn ?b))
(decrease (avatar-energy)3)

(forall (?next - bending)
(when(next-in-order ?b ?next)
(next-to-learn ?next)

))
)
)

(:action fight
:parameters 
(?t - threat ?b - bending ?l - location ?from ?to - location
)
:precondition(and
(at-avatar ?l)
(at-spirit-animal ?l)
(threat-at ?t ?l)
(fight_requires ?t ?b)
(learned ?b)
(blocked-by ?t ?b)
(>= (avatar-energy)4)
(not(threat-defeated ?t))

)
:effect (and
(threat-defeated ?t)
(not(blocked-by ?t ?from ?to))
(decrease(avatar-energy)4)
)

)

(:action mission
:parameters(?m - mission ?b - bending ?l - location)
:precondition (and
(at-avatar ?l)
(at-spirit-animal ?l)
(mission-at ?m ?l)
(mission-requires ?m ?b)
(learned ?b)
(not (mission-done ?m))
(>= (avatar-energy)2)
)
:effects (and
(mission-done ?m)
(decrease (avatar-energy)2)

)
)

(:action rest
:parameters(?l - location)
:precondition (and 
(at-avatar ?l)
(at-spirit ?l)
(safe-location ?l)

(or (<(avatar-energy)(max-avatar-energy))

(<(spirit-animal-energy)(max-spirit-animal-energy))
)
)
:effects (and
(when (<(avatar-energy)(max-avatar-energy))
(increase (avatar-energy)1)
)
(when (< (spirit-animal-energy)(max-spirit-animal-energy))
(increase (spirit-animal-energy)1)

)

)

)
)