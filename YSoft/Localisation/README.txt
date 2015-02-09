1) localisation docs:

Script is written in Ruby so the user has to have Ruby installed.

I like to use external beforehand prepared and over time enhanced modules so there is files_helper.rb file with
such a module. This implicates sometimes more lines than necessary but often faster written code and
it also serves as a reminder how to do some easy to forget things.

When you are sure you have installed Ruby (https://www.ruby-lang.org/en/documentation/installation/), you can run
the script from console by "ruby localisation.rb". It will try to find localisation.zip in the actual directory of
the script or you will be prompted to provide address of that localisation.zip file, it should be called that way or
you can change the value in the script. It depends on gems which I think are installed by default with Ruby - 'zip' and
'fileutils'. You can also provide the address when starting the script as: "ruby localisation.rb <address>". If you would like to end the prompt, enter "exit”.

I hope it works and have a nice day.