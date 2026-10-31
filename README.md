# **Golf?**
## Golf? is a puzzle platformer game about kicking a ball around to a flag to complete levels.
![demo](demo_video.png)

## [Play Golf? on itch.io](https://hedgehog8110.itch.io/golf)

*Controls:*
  - When in the start screen, click space to start the game.
  - A or left arrow to move left, D or right arrow to move right, and W or up arrow to jump.
  - While in the air, tap up arrow or W to double jump in the air.

*Gameplay:*
  - Use the control keys to maneuver the ball to the flag at the end of the level.
  - Buttons: Touch the button with the ball or the player to remove parts of the level, dotted wires indicate a connetion to the dissapearing wall.
  - Teleporters: The teleporters can only teleport the ball, or the player at once, depending on the switch position. For example: when the dots on the teleporters are set to white, it will only teleport the player, but when the dots are set to blue, it will only teleport the ball.
  - Switches: Touch switch with the player or the ball to toggle its mode. When the dot in the middle is white, it will set the teleporters to only teleport the player, but when the dot is blue, it set the teleporters to only teleport the ball.

*Features:*
  - Puzzle aspects, like the switches and buttons
  - Tricky platforming
  - Teleporters
  - Buttons and switches
  - Ranking based off the time you score.

*Technical aspect:*
  * The teleporters:
    * How they work: Both teleporters set their position when the level starts, and they set their animation depending on what the switch is set to. When an object like the ball or player enter the teleporter (it uses a on_body_entered function) it sets a global variable to "Player" or "Ball" depending on which has entered (if the switch is set to the object that enters). In both the player and ball code it is detecting if the global variable is set to itself. If it is, it will check which teleporter is transmitting the variable, and set its position to the opposite teleporter.

*Credits and thanks*
  - Pixabay for music and sounds
  - Friends, family and school teachers for helping out with some bugs
  - YouTube Godot tutorials
 
 
