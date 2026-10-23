(define (problem avatar-air-example)

(:domain avatar-journey)

(:objects
southern-water-tribe
northern-water-tribe
omashu
ba-sing-se
eastern-air-temple
western-air-temple
fire-nation-capital
roku-island
    - location

waterbending
earthbending
firebending
airbending
    - bending

fire-nation-soldiers
Vatuu
    - threat

help-villagers 
help-spirits
    - mission

)

(:init

(at-avatar western-air-temple)
(at-spirit-animal western-air-temple)


(= (avatar-energy) 10)
(= (spirit-animal-energy) 10)
(= (max-avatar-energy) 10)
(= (max-spirit-animal-energy) 10)

(connected southern-water-tribe omashu)
(connected omashu southern-water-tribe)

(connected omashu ba-sing-se)
(connected ba-sing-se omashu)

(connected omashu eastern-air-temple)
(connected eastern-air-temple omashu)

(connected western-air-temple eastern-air-temple)
(connected eastern-air-temple western-air-temple)

(connected ba-sing-se fire-nation-capital)
(connected fire-nation-capital ba-sing-se)

(connected fire-nation-capital roku-island)
(connected roku-island fire-nation-capital)

(connected southern-water-tribe northern-water-tribe)
(connected northern-water-tribe southern-water-tribe)


(teacher-at waterbending southern-water-tribe)
(teacher-at earthbending omashu)
(teacher-at airbending western-air-temple)
(teacher-at firebending fire-nation-capital)

(next-to-learn airbending)

(next-in-order airbending waterbending)
(next-in-order waterbending earthbending)
(next-in-order earthbending firebending)

(safe-location western-air-temple)
(safe-location eastern-air-temple)
(safe-location southern-water-tribe)
(safe-location northern-water-tribe)
(safe-location roku-island)





(threat-at fire-nation-soldiers ba-sing-se)

(fight-requires 
fire-nation-soldiers 
airbending)

(blocked-by 
fire-nation-soldiers
ba-sing-se
omashu
)

(blocked-by
fire-nation-soldiers
omashu
ba-sing-se)

(mission-at help-villagers ba-sing-se)
(mission-requires help-villagers earthbending)
(mission-requires help-villagers waterbending)

(mission-at help-spirits roku-island)
(mission-requires help-spirits firebending)

)

(:goal
(and
(mission-done help-villagers)
(mission-done help-spirits)

)
)


















)