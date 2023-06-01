# Roshambo

This is a Rock Paper Scissors game.
It is an exercise in the Udacity UIKit course.
The assignment asks that we use three different methods to pass informaiton to the second view controller.
I'm posting it here to get feedback from Udacity mentors and/or other students.

## Differences Between My Solution and Theirs

I'm listing the major differences between my solution (here) and Udacity's in order to understand which approach (if either) is better in each case and why.

Udacity's solution can be found here: [https://github.com/udacity/ios-nd-uikit.git](https://github.com/udacity/ios-nd-uikit.git)

I am refering to their first solution which is in the directory: step2.6-roshambo-exampleSolution


## Difference 1 - calculating results

**My Solution**:
	I made a big old nested switch statement with nine total possibilities to determine the winner of each match, what to display in the text, and what to display in the picture.

**Udacity Solution**:
	They made a more efficient? switch statement to determine the winner of each match, using some syntax I was unaware of. It looks like they created a tuple out of userChoice and opponentChoice just for the switch statement. Then used a “let / where” statement (another thing I didn’t know you could do) to consider the case for a tie.
  
I find my own switch statement easier to read, maybe just because I wasn't familiar with some of the syntax. Is there an advantage to the way they did it in efficiency somehow?

**Question**:
In the comments they ask: // Why is an exclamation point necessary? :)
This is referring to the variable userChoice! - it is defined as a forced optional, so it needs to be used as a forced optional? I noticed in my own work that if I defined a variable inside the view controller, it needed to have either a ! or a ? or a value assigned, or Xcode wanted me to initialize the controller. 
Is that right? I think it’s because Swift doesn’t sit well with a variable that has no value unless it is explicitly set up to have no value.

 
## Difference 2 - organizing tasks

**My Solution**:
	I did all my calculations before calling the second view controller. The information I passed along was the message to display and the image to display. In the second controller I just displayed the views.

**Udacity Solution**:
	They passed along the user’s throw to the second view controller, then did the calculations there before displaying results.

I’m not sure whether one method is better than the other for any reason??

They commented: // Ideally, most of this would be handled by a model.
Which is kind of what I was thinking. However we only have view controllers to work with so far in our learning. I guess this explains why displayResult() is made into a separate function in their solution, when it could all live inside “viewWillAppear”.


## Difference 3 - reading user input

**My Solution**:
	I have one function triggered by the throwRock button, and one triggered by prepare for segue. The prepare for segue function identifies the user’s choice through the name of the segue that triggers it. The throwRock function assumes the user’s choice was rock since it’s triggered by the rock button. If I were to refactor this to use one method, while preserving my approach, I would either need to build two more functions, one for each button, or add a third option to my switch statement, if I were to use segues.

**Udacity Solution**:
	They created a function that reads the user’s choice from the name of the UIButton pressed (which I didn’t realize was possible; it depends on using the “sender:” parameter.) This function is called for all three methods of transitioning view controllers. If they were to refactor this to use one method, their getUserShape() function would still do the job without any changes.


## Difference 4 - referring to images

**My Solution**:
I used the image names as they were given in the files. I noticed there were different types of files and different naming conventions used. My nine-option switch statement allowed me to use the file names as they were.

**Udacity Solution**:
They re-named all the files with a new convention so that the names could be built from variables.

Not sure whether this difference is important.


## Difference 5 - setting up an enum / random choice

**My Solution**:
I set up an enum for rock/paper/scissors inside the first view controller. I set up a separate function to chose a random throw. For my random number generator I used the more recent Swift syntax: let choice = Int.random(in:0...2)

**Udacity Solution**:
They set up an enum for rock/paper/scissors which includes the random throw function (didn’t know you could do that) and they placed it in the same file as the second view controller but outside of the controller itself.
I like having the random choice generator as part of the enum.

**Big Question** 
Does it matter where you put the enum declaration??
My guess: technically no, but there is probably a best practices answer to this.



