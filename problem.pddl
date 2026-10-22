(define (problem avatar-air-example)

(:domain avatar journey)

(:objects
southern-water-tribe
Northern-water-tribe
Omashu
Ba-sing-se
Southern-air-temple
Western-air-temple
Fire-nation-capital
Roku-island
    - location

waterbending
earthbending
firebending
airbending
    - bending

Fire-nation-soldiers
Vatuu
    -threat

help-villagers 
help-spirits
    -missions

)

(:init

(at-avatar western-air-temple)
(at-spirit-animal western-air-temple)


(= (avatar-energy)10)
(= (spirit-animal-energy)10)
(= (max-energy)10)

(connected southern-water-tribe Omashu)
(connected Omashu southerm-water-tribe)

(connected Omashu Ba-sing-se)
(connected Ba-sing-se Omashu)

(connected Omashu Eastern-air-temple)
(connected Eastern-air-temple Omashu)


;Finish map later

(teacher-at waterbending southern-water-tribe)
(teacher-at earthbending Omashu)
(teacher-at airbending air-temple)
(teacher-at firebending fire-nation-capital)

(next-to-learn waterbending)

(next-in-order waterbending earthbending)
(next-in-order earthbending firebending)
(next-in-order firebending airbending)

(threat-at mountain-guard Ba-sing-se)
(fight-requires fire-nation-guard airbending)
(blocked-by 
Fire-nation-soldiers
Ba-sing-se
Omashu
)

(mission-at help-villagers ba-sing-se)
(mission-requires help-villagers earthbending)

()
()
()


)


















)