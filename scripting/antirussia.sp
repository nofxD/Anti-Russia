/*
 * MIT License
 * 
 * Copyright (c) 2022 nof
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
#include <sourcemod>
#include <cstrike>
#include <geoip>

#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo =
{
    name = "[CS:GO] Anti Russia",
    author = "nof",
    description = "Ban player's from russia.",
    version = "1.0",
    url = "https://steamcommunity.com/id/nofxD"
};

public bool OnClientConnect(int client, char[] rejectmsg, int maxlen)
{
    char ip[15];
    char country[45];

    GetClientIP(client, ip, sizeof(ip));
    GeoipCountry(ip, country, sizeof(country));

    if (StrEqual("Russia", country))
    {
        strcopy(rejectmsg, maxlen, "Free Ukraine / Свободная Украина!");
        return false;
    }
    return true;
}