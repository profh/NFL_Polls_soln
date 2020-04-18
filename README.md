NFL Polls :: Spring 2020
===
Because of the challenges of remote education, the first technical challenge we have for you today is to build a basic Poll class in Ruby that will help the NFL run some online polls.  This will cover a number of skills discussed in class related to testing, the Ruby object model, refactoring, and others.

This project is being released at or around 12:01am EDT on Wednesday, April 21, 2020 via our GitLab server at darkknight-cmuis.net and must be completed and posted back to your private repository on darkknight no later than 11:59pm EDT on the same day.  It should not take all day to complete it, but given we have students throughout the world right now, a 24 hour period should allow everyone, wherever they may be, ample time to complete the technical challenge in a timely manner.

Getting Started
---
Having downloaded this starter code from your private repository on darkknight-cmuis.net, I suggest the first thing that you do is look at the `Poll` class in action.  You have a file called `sandbox.rb` that runs through two examples of the `Poll` class being used and contains some comments to help you understand better what it happening.  Of course, since the `Poll` class isn't working yet, I have also provided a screenshot of the output from `sandbox.rb` running in the terminal so you can clearly see what it produces. (This screenshot is in 'sample_output' folder)

Second, and even more importantly, we have a testing file `poll_testing.rb` for you.  Tests serve as a form of documentation and that is certainly the case here.  The tests themselves are pretty clear, but I've added some commentary as well to aid your understanding.  Finally, I've given you some test helpers that should also help you through this process.

Of course, it is not just the tests that have helpers, but the `Poll` class has a `PollHelper` module that can and should be used.  In fact, a _lot_ of heavy lifting goes on in this module, so be sure to read through it and take advantage of all its functionality so that you are 'not reinventing the wheel', as they say. 


Requirements
---
You mission, should you choose to accept it, is to create a `Poll` class in Ruby that will pass the ten tests found in `poll_testing.rb`. (These tests can easily be run on the command line with the command `ruby poll_testing.rb`.)  There is an initial file for this called `poll.rb` and that file is already tied into the testing file, but right now it is completely blank.  This is your canvas, and as a Ruby artist, it is your job to 'paint a beautiful picture' (or at least one that passes all the tests).  

Of course, you've also been given a nice set of tools to help paint that picture, but it is your choice whether and how to incorporate them.  You may _not_, however, use any other outside libraries or gems for this project aside from the minitest gems that this code needs for testing (and should already be installed on your computers after completing phases 3 and 4).

One thing to note is that in order to essentially test "print" methods -- that is, those methods which could output information to the user -- we are having you save the relevant output to a buffer.  In this case, our buffer is just a simple array and as you can see from the `sandbox.rb` file, we can print that buffer content at some point with a `puts` command.  Our print methods basically end and are tested after the buffer output content is created.  There are additional comments/notes in the tests themselves to guide you on this matter.

**In addition to completing the coding, you must also read and complete the Academic Integrity statement -- failure to do so will result in an immediate zero grade.**


Constraints
---
You are free to use your notes, look at any course code posted online, and look at the labs we did this semester.  You may look on [stackoverflow.com](https://stackoverflow.com) for past answers that may be helpful to you as well as look at the online API for Ruby at [apidock.com](https://apidock.com).  You may not post any questions related to this assignment on any online forum nor can you answer any questions that could relate to this assignment during this time.  Most importantly, you cannot share code or converse with any present or past student in the class regarding this assignment while it is ongoing.  _More constraints are spelled out in the Academic Integrity statement that you must complete to get credit for this assignment._


Completing the Assignment
---
The assignment must be completed and posted on your private repository (same place you retrieved this code from) no later than 11:59pm EDT on April 21, 2020.  The code must be on the master branch (no other branches will be graded) and the base level of the repository should be the base level of the application.  At the due time, all student repositories will be locked and you will have no further access. Do not attempt to zip your code and email it to Prof. H or the TAs after the deadline; Gmail will filter this out anyways thinking the code could be malware.

After pushing your code to your private repository, be sure to go to gradescope and upload your solution from darkknight to the gradescope assignment just as you did in Phase 4. (See piazza if you did not do this in Phase 4 for instructions regarding gradescope and gitlab.)  If successful, gradescope will give you an acknowledgement of receipt, but it will not give you any details on the tests that passed (or didn't).  Please be aware that _the gradescope tests may vary slightly to catch people who try to undermine the integrity of the process by hardcoding test results_. If your tests pass locally and you have not hardcoded the output from the functions, then you will have no problem with the gradescope tests.

Partial credit is available, of course, and you will get credit for as many of the tests as you get to pass in the time allowed.  We are not debugging nor giving partial credit for spelling mistakes, capitalization issues or other formatting problems, so please be careful of these types of problems.

Finally: **If you have not done so already, be sure to electronically sign off on the Academic Integrity Pledge in the PLEDGE.md file.** Failure to do so will result in an immediate zero grade. (This was discussed at length in class and mentioned twice here in bold and once in italics, so we are pretty serious about this matter.)

---
As always, should you or any of your IM Force be caught or killed, the Secretary will disavow any knowledge of your actions. This file will self-destruct in ten seconds. Good luck.