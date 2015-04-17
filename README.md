#HUGGERS#
*Huggers; a patronising code name.*

##Mission
---------
Huggers is: a dating app themed around existing relationships, maintaining and gamifying relationships, promoting communication between existing partners and contextualising those relationships within friendship groups.

Huggers also: provides meatmarket functionality for people not in existing relationships, but more thematically focussed on people looking for romantic partners; the opposite of tinder hookups.

##Why?
------
- Users use dating apps to find each other, then the app is useless. if the relationship ends you need to take out the app again and dust off the cobwebs.
- To communicate with your partner you use your phone, text message or a texting app like what's app, facetime or skype, snapchat for safe photo-sharing etc. You also use these for everyone else (not special).
- This 'transformer app' serves a double life letting you get the most out of an app in both relationship phases.
- This app provides the place for relationship focusses social messages, which are annoying in other contexts (facebook feeds etc.)
- This app helps to gamify relationships and provide a place for a type of communication that sometimes is easier not face to face for people who prefer to avoid conflict, aiming to act as a relationship maintenance tool.
- We want a long term relationship with you too! This means we don't mess you about; we don't store your nudies on our server (just your public profile pics), if you clear a chat log so do we, your privacy will never be on-sold etc.

##Target Users
--------------
- People who want romantic relationships rather than hookups
- People who are in relationships and want a (themed) hub for communication with their partner
- 18 to 35 (or older where interested in tech and gamification features etc) tech savvy year olds NB: separate version for teens is possible
- People concerned with privacy and safety of digital information
- People who want a place to have relationship information in a social context

##Technologies
--------------
- `Ruby` back end
- `Sinatra` web serving
- `Heroku` web hosting
- `Postgres`|and|psql|database|fun|
- `JavaScript` for interactive front end, using `AJAX` for good flavours
- `HTML`/`CSS` mobile first yo
- ~~Omnigraffle for wireframes~~ Actually no Omnigraffle is way too complex to learn in zero time, so pen and paper
- `Trello` for task tracking/project management
- `git`/`Github` for version control
- more features means more technologies; come back and check it out in future versions!

##Issues Encountered
--------------------
Many! Some of the more painful specific issues encountered are expanded below.

Styling mobile first was great, until it turned out that it wasn't. Specifically, inconsistent scaling between device pixel scaling foiled my initial attempt to style using height/width % combined with em. Everything looked great until I tried to change from one device to another (iPhone 4 -> 5). Styling using vh and vw units (thanks Luke for the tip!) was far more effective and solved my problem. Providing a desktop site still presented many challenges.

The great Not Knowing. Lack of experience in best (or really any) practice has led to probably innumerable design flaws! For example, I'm currently passing the current @user through to the page from the database using ruby. Does this make things slow when many users are present? I don't know! But if it did I would probably want to write an API for that and use AJAX to fetch it client-side.

##Cool Things
-------------
Things I wanted to and managed to get in:
- retained content for unfinished forms that fail to submit
- mobile first design
- simple profile photo gallery
- view public profile from private

Trello is cool for managing tasks (though is probably limited to simple projects and/or a few users).

DT is in a relationship with Katy Perry which is pretty neat.

##Bugs
------
So many bugs...

let me know pls philipcastiglione at gmail etc

##Version 0.2
-------------
At 10:57am Friday 17th April...
![Wish List 1](/documentation/v0.2/wishlist1.jpg)
![Wish List 2](/documentation/v0.2/wishlist2.jpg)
![Wish List 3](/documentation/v0.2/wishlist3.jpg)
![To Do 1](/documentation/v0.2/todo1.jpg)
![To Do 2](/documentation/v0.2/todo2.jpg)

