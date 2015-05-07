# workout-generator
A simple workout generator using command line, ruby, and SQLite


##Project Vision
This will be a small command line program that randomly generates a workout based upon the user input. A user can create either a swim, run, or bike workout and asign it an intensity of 1-5. The user can then generate a list of the possible workouts, and edit them. The user then asks the program for a workout and give the program an intensity.

#Features

##Add an exercise:
In order to keep all my workouts straight I want to create a workout and add it to my list. 

```
Usage Example:
> ./workout-generator
1. Add a workout
2. List all exercises
3. Create Workout
4. Exit 

> 1
Please Enter the Name of Your First Exercise:
> Push Ups
Please Enter the number of reps:
> 15
Would you like to Add another exercise? (y/n)
> n
Exit
```

##Viewing the Exercises
I need to look over my exercises before choosing one, or to make an edit to my workout.

Usage Example:
```
> ./workout-generator
1. Add a workout
2. List all exercises
3. Create Workout
4. Exit 

> 2

A. 15 Pushups
B. 3 Pullups
C. 10 Pullups
D. 15 squats
E. 20 Curls

Select Action
1. Edit
2. Delete
3. Home

```

##Edit my existing Workouts
I am getting bored with my workout so I want to go in and edit my workouts to add new exercises to it. 

Usage Example:
```
> ./workout-generator
1. Add a workout
2. List all exercises
3. Create Workout
4. Exit 

> 2

A. 15 Pushups
B. 3 Pullups
C. 10 Pullups
D. 15 squats
E. 20 Curls

Select Exercise
> A

15 Push Ups

Choose Action:
1. Edit
2. Delete
3. Go Back

> 1

Edit Workout:

```

##Remove A Workout
I am over this workout becuase it's too hard on my knees so I want to remove it.  

Usage Example:
```
> ./workout-generator
1. Add a workout
2. List all exercises
3. Create Workout
4. Exit 

> 2

A. 15 Pushups
B. 3 Pullups
C. 10 Pullups
D. 15 squats
E. 20 Curls

Select Exercise
> A

15 Push Ups

Choose Action:
1. Edit
2. Delete
3. Go Back

> 2

Edit Exercise:

```

##Ask for Workout
I can't decide which workout to do to, I want to be told what to do today.



