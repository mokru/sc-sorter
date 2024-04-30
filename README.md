One click sorter for images.

I personally use this to sort screenshots i take in FFXIV.

If you wanna use this make sure you take some backups before you try it out to see if it works for you.

At first execution it will ask for a folder path. If folder path is invalid it will ask again until it is valid. 
This script looks for .png files in the folder provided. 
After finding all .png files in the folder it will go trough them and get the year and month the file was last changed.
It will search for a folder with the matching year and month in the format YYYY-M (the month is just the int ie. "4" and not "04" for april)
If it finds the folder it will move the file into that folder. If it doesn't find the folder it will create it and move the file into the folder
