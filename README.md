# Watch It


## A CLI App by Chris Volpe and Dan Powell

### Summary

    **Watch It** is a tool for storing a personal watchlist (or to-watch list) of
  movies and TV shows. It references the API from [The Movie DB](https://developers.themoviedb.org/3/getting-started/search-and-query-for-details) and _requests_ the relevant data to populate a small text-and-number database stored locally on your computer. The rest of the magic is just good old-fashioned conditional-based logic.

### Download Instructions

    1. If you don't already have a GitHub account, make one. While you're at it, make sure Git and Ruby are installed on your machine.
    2. Go to the app's [GitHub page](https://github.com/cvolpe12/module-one-final-project-guidelines-nyc-web-career-010719).
    3. Click on the green button to the right of the screen and select _Download Zip_ from the options. This will download a compressed version of the app that will expand the first time you open it.
    4. In the command line application on your computer, navigate to the directory where you'd like to store the app (`cd {parent_directory}/{file_name}` if you're unfamiliar with the command line). A directory is just what is colloquially known as a file.

### How to use

  1. From the app's main directory in the command line, type the command `ruby bin/run.rb`. _This instructs the Ruby compiler to compile the code written in the app's **run** file, essentially **running** the program. The **run** file itself is very simple, but it references the code written in the other files and directories throughout the **Watch It** file tree, which provide it everything it needs. Some of those files contain code that makes requests to the online Movie DB API. These blocks of logic, commands, and persistence (storage) create a synergistic system with your computer and a little bit of the web to bring you the functionality of **Watch It**._
  2. Using numbers as commands, select Login if you already have a user account you want to use, or Register if you would like to make a new account. Once you've followed the prompts to log in or register, you'll arrive at the main menu.
  3. `Search` allows you to search for any movie, TV show, or person in the MovieDB database. `Watchlist` takes you to the watchlist menu, where you can view your current watchlist or add items to it.
  4. At any point, you can select the `Quit` option, which will exit the program.
  That's it! We hope you enjoy playing around with **Watch It**. Feel free to make contributions or point out bugs via GitHub!
