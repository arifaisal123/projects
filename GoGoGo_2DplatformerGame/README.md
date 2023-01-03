# GoGoGo_2DplatformerGame
#### Video Demo:  https://www.youtube.com/watch?v=xvmPgU6oSwY
#### Description:

## Installation Guide

i. Download Love2D game engine (https://love2d.org/) in your pc.
-> For 64-bit win installer, go to https://github.com/love2d/love/releases/download/11.4/love-11.4-win64.exe
-> For 32-bit win installer, go to https://github.com/love2d/love/releases/download/11.4/love-11.4-win32.exe

ii. Ensure that lovec.exe file is in your program files LOVE folder (C:\Program Files\LOVE\lovec).

iii. Unzip the game file (GoGoGo_2DplatformerGame.rar).

iv. Click on run.bat to play the game.

## How to Play

i. Click on run.bat in the game folder to start the game

ii. Use arrow keys or W,A,D, space to move/ jump player character.

iii. Complete all the sections, dodging the enemies, and collecting cookies.

iv. Reach the CS50 section to finish the game.

v. Press Escape key from keyboard to close the game anytime.

## About the Game

The game is inspired from the several weeks of CS50 course.
The game has 11 different stages on the same level, taking cues starting from week 0 in scratch till the last week.
The game uses LUA programming language, and it is built on LOVE2D game engine.

## Programming Functions
Love2D engine requires 3 major functions to run. They are- love.load(), love.update(), and love.draw().

They are all implemented in the main.lua file.

#### main.lua
This is the main programming file of the game where all relevant files are connected. The file starts with specifying the different objects which are required for the game to run.

love.load() function is used to load game assets, including player, enemy, map, GUI, sound, and background.

love.update() function deals with the objects which changes as the user plays the game, and hence needs frequent update.

love.draw() function draws the relevant objects as per the specifications given using the love.graphics module.

love.keypressed(key) function is implemented for the game to make use of the keyboard keys to play the game. Pressing the escape key kills the game.

beginContact() and endContact() function is used to check for collision between two different objects. It helps to take hit when an enemy gets collided with the player, or helps to collect cookies as points.

#### conf.lua
This file is required for the game to run. It helps to select the title, and window size of the game.

#### map.lua

This is another important file for the game to run. Although for this game, only 1 map is used, further maps can be added through this function. It makes use of the physics module of the Love2D engine.

STI file/folder is used for the easy implementation of this module.

#### camera.lua
This file is required so that the screen moves wherever the player goes.

#### GUI.lua
This file is used to create a Graphical User Interface or GUI at the top left and right corner where lives (as hearts), and cookies are displayed respectively.

#### player.lua
Main player character is implemented in this file.

#### enemy.lua
9 enemies numbered from 1-9 are implemented sequentially as enemy1...2...3...lua.

#### cookie.lua
This cookie file is created for the player to collect cookie points.

#### deadlyflower.lua
This file is implemented to take a negative hit on the player's lives. It will take 1 life out when the player collides with it. The implementation is similar to that of spike.lua.

#### spike.lua
Implementation and usage similar to that of deadlyflower.lua.

#### stone.lua
The implementation is close to that of deadlyflower and spike.lua. However, the player will not take any hit for colliding with it. Rather, the player can move the stone to his/her requirement.