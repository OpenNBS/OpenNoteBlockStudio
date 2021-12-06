
# OpenNBS Website


To run the website locally:

1. Be sure to have Git installed and in your PATH file (It's not in your PATH if you use Github Desktop, I recommending installing [Git for Windows](https://gitforwindows.org/) in addition)
2. Have [Ruby](https://rubyinstaller.org/) installed and in your PATH file (Devkit version, latest Ruby version should work fine)
3. Install Bundler: Open cmd and type `gem install bundler` (Make sure Ruby is installed and in your PATH, then the command should work)
4. If first time building, you might need to run `bundle install` in this directory.
5. Double click the `run.cmd` file. It should look something like this:

![Alt text](readme/cmd.png?raw=true "Cmd example")

Alternatively you can run `bundle exec jekyll s` in this directory yourself

6. Visit the website at http://localhost:4000/, it should automatically update while you're making changes. If not, just close and double click run.cmd again and it refreshes.
