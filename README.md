# One-click Sorter for Images

I personally use this script to sort the screenshots I take in FFXIV.

If you want to use this script, make sure to take some backups before trying it out to see if it works for you.

## Usage

1. On the first execution, the script will ask for a folder path. If the folder path is invalid, it will keep asking until a valid path is provided.
2. The script looks for .png files in the provided folder.
3. After finding all .png files, it will go through them and retrieve the year and month the file was last changed.
4. It will search for a folder with the matching year and month in the format YYYY-M (e.g., "2022-4" for April 2022).
5. If the folder is found, the script will move the file into that folder. If the folder doesn't exist, it will create it and then move the file into the folder.

Feel free to customize the script according to your needs!
