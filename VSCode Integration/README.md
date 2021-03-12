# VS Code Integration



## Pros and Cons
pros and cons in comparrisson to the native Godot-IDE 

|                      Pro                     |                            Con                            |
|:--------------------------------------------:|:---------------------------------------------------------:|
| Improved readabillity of Folder structure    | unreliable Debugging leads to switching between both IDEs |
| quicker acces to Documentation               | needs some time to set up and to get used to it           |
| Intellisense Autocomplete                    | Needs more RAM                                            |
| Custome documentation                        | settings may be changed/ajusted in Future by me           |
| Bookmarks                                    |                                                           |
| Keybinds for improved workflow               |                                                           |
| improved overview of JSON-files              |                                                           |
| Insertion of snippets by typing out keywords |                                                           |



## Extensions
of cause feel free to remove or add Extensions as you like.  
we want to thank every developer of their Extensions for improving our development and mention them in the following lists

you can find them in the extensions-Sidebar (four squares) or by using the shortcut ``Ctrl + Shift + X``:

###### Generall


| Name            | Usage                                         | Prerequisites     | Developer         |
|-----------------|-----------------------------------------------|-------------------|-------------------|
| docs-markdown   | adds custome Syntax and functions to md-files |                   | Microsoft         |
| docs-preview    | gives a preview of the current markdown       |                   | Microsoft         |
| docs-image      | improved configuration of Images in md-files  |                   | Microsoft         |
| Mono Debug      | enables debugging via VS Code                 | See further below | Microsoft         |
| godot-tools     | Adds a great Variety of GDScript support      | See further below | Geequlim          |
| vscode-icons    | custome folder icons                          | See further below | VSCode Icons Team |
| json            | Treeview for json-files                       |                   | ZainChe           |
| multi-command   | needed for our keybindings                    |                   | ryuta46           |
| Comment ANchors | Adds Bookmarking and CSS-styling for comments |                   | Exodius Studios   |


###### Personal Preferences of our Team


| Name         | Usage                                   | Developer                  |
|--------------|-----------------------------------------|----------------------------|
| One Dark Pro | nice Theme with ligature compatibillity | binaryfy                   |
| Hasklig      | Monospace font with ligature            | [Ian "i-tu" Tuomi on Github](https://github.com/i-tu/Hasklig) |



## Installation
The godot-tools extension needs (aside of my own settins) further prepartaion:


###### The right Godot-IDE
instead of the "normal" Godot-IDE, you need the [Mono-version](https://godotengine.org/download/windows) and its [SDK](https://www.mono-project.com/download/stable/)  to be able to write code in the external VS Code editor

###### The settings in Godot
remmber to check the box for external editors in Texteditor -> Mono -> Editor  

Hint: there are two similar sounding setting-menues in Godot which at least i did not recognice in the beginning.  
there are setting for projects and for the Editor in the coresponding tabs, we are looking for the Editor one.


###### The settings in VS Code
there are multiple things we need to ajust in the settings file of VS Code but no worries, mine can be found as template in this folder.  
just insert your own Informations in the lines with the comment ``#INPUT_NEEDED ``


## Settings
one Great Feature of VS Code is its abillity to change deep cutting settings via  JSON files,this is also true for the most of its Extensions.   You can find my own customications in this folder, and copy and  personalice them  
There are four files we want to modify for our comfort:  

###### settings
`` Settings.json `` is the most important one and modifies everything which relates to the editor itself and its Extensions

###### launch
`` launch.json `` is used for establishing a connection between VS Code and Godot.

###### VS Code Snippets
`` SettingsVS Code Snippets.json `` has some blocks of code which are used frequently in our development. they can be autocompleted by typing `` SNIPPET``*name*

###### VS Code Keybinds
`` Keybinds.json `` are custome macros i have found very usefull in the daily process,they are ordered on the numpad and intended to enable a Navigation in VS Code without the need of a mouse