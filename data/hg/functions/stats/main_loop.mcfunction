execute if score tghhgDummy gameStart matches 1 run schedule function hg:stats/main_loop 1s
execute if score tghhgDummy gameStart matches 1 run execute as @a[team=alivePlayer,scores={Dead=1}] run team join deadPlayer @s
execute if score tghhgDummy gameStart matches 1 run execute as @a[team=deadPlayer,gamemode=!spectator] run gamemode spectator @s

scoreboard players set tghhgDummy playersLeft 0
execute if score tghhgDummy gameStart matches 1 run execute store result score tghhgDummy playersLeft if entity @a[team=alivePlayer]

execute if score tghhgDummy playersLeft matches 1 run title @a subtitle {"text":"","extra":[{"selector":"@a[team=alivePlayer, limit=1]"},{"text":" has won!"}]}
execute if score tghhgDummy playersLeft matches 1 run title @a title {"text":"Winner!","color":"#FFD700"}

execute if score tghhgDummy playersLeft matches 1 run scoreboard players set tghhgDummy winReset 1

execute if score tghhgDummy playersLeft matches 1 run scoreboard players add @a[team=alivePlayer, limit=1] playerWins 1
execute if score tghhgDummy playersLeft matches 1 run team join winnerPlayer @a[team=alivePlayer, limit=1]

execute if score tghhgDummy winReset matches 1 run schedule function hg:end_game 10s
execute if score tghhgDummy winReset matches 1 run scoreboard players set tghhgDummy gameStart 0
execute if score tghhgDummy winReset matches 1 run scoreboard players set tghhgDummy winReset 0