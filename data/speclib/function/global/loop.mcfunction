#> score check
execute as @a[tag=speclib.spectatee] at @s run function speclib:global/score_check

#> teleport root
execute as @e[tag=speclib.root] at @s run function speclib:global/score_check
execute as @e[tag=speclib.root,predicate=speclib:id] at @s at @e[tag=speclib.spectatee,predicate=speclib:id,sort=nearest,limit=1] run tp @s ~ ~ ~

#> rotating spectator
execute as @a[tag=speclib.spectating] at @s run function speclib:global/score_check
execute as @e[tag=speclib.cam,predicate=speclib:id] at @s rotated as @p positioned as @e[tag=speclib.root,sort=nearest,limit=1] run tp @s ^ ^ ^-2.1

#> kill all unequipped cameras:
execute as @a unless score @s speclib.id = @e[tag=speclib.spectatee,sort=nearest,limit=1] speclib.id run tag @s remove speclib.spectating
execute as @e[tag=speclib.cam] unless score @s speclib.id = @p speclib.id run kill @s
execute as @e[tag=speclib.root] unless score @s speclib.id = @p speclib.id run kill @s
