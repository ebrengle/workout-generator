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
4. View Workouts
5. Exit

> 1
Please Enter the Name of Your First Exercise:
> Push Ups
Please Enter the number of reps:
> 15
Would you like to Add another exercise? (y/n)
> n
Exit
```

##Viewing an Exercises
I need to look over my exercises before choosing one, or to make an edit to my workout.

Usage Example:
```
> ./workout-generator
1. Add an exercise
2. List all exercises
3. Create Workout
4. View Workouts
5. Exit

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

##Edit an Exercise
I am getting bored with my workout so I want to go in and edit my workouts to add new exercises to it.

Usage Example:
```
> ./workout-generator
1. Add an exercise
2. List all exercises
3. Create Workout
4. View Workouts
5. Exit

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

##Remove an Exercise
I am over this exercise becuase it's too hard on my knees so I want to remove it.

Usage Example:
```
> ./workout-generator
1. Add an exercise
2. List all exercises
3. Create Workout
4. View Workouts
5. Exit

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

Are you sure you want to delete: 15 Push Ups ? (y/n):

>y

```

##Create Workout
Tell me which exercises to do to, I want to be told what to do today.

Usage Story:

```
> ./workout-generator
1. Add an exercise
2. List all exercises
3. Create Workout
4. View Workouts
5. Exit

> 3

How many exercises would you like to do today in your workout?

> 4

1. 15 Push Ups
2. 60 Situps
3. 3 mile run
4. Stretch

```

##Saving a Workout
Tell me which exercises to do to, I want to be told what to do today.

Usage Story:

```
> ./workout-generator
1. Add an exercise
2. List all exercises
3. Create Workout
4. View Workouts
5. Exit

> 3

How many exercises would you like to do today in your workout?

> 4

1. 15 Push Ups
2. 60 Situps
3. 3 mile run
4. Stretch

Would you like to save this workout? (y/n)

>y

Workout name?

>ECB 15 Minute Workout

Excellent, ECB 15 Minute Workout has been saved.

```


##Viewing a Workout
Tell me which exercises to do to, I want to be told what to do today.

Usage Story:

```
> ./workout-generator
1. Add an exercise
2. List all exercises
3. Create Workout
4. View Workouts
5. Exit

> 4

1. ECB 15 Minute Workout

> 1

1. 15 Push Ups
2. 60 Situps
3. 3 mile run
4. Stretch


1. Delete Workout
2. Exit


