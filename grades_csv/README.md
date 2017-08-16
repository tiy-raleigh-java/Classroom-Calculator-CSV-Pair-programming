---
course: Ruby on Rails
title: CSV Gradebook
category: pair_programming
---

Using a CSV of student names and assignment grades, and your code from [yesterday's project](https://newline.theironyard.com/courses/4/projects/58), you will generate a report from a CSV. For example, given the following CSV:

```
Student,Project 1,Project 2,Quiz
Evelyn,90,95,85
Marley,80,85,90
Hayden,75,85,80
```

you should generate a report like the following:

```
Average by student:
  Evelyn: 90 (A)
  Marley: 85 (B)
  Hayden: 80 (B)

Average by assignment:
  Project 1: 81 (B)
  Project 2: 88 (B)
  Quiz: 85 (B)

Class average: 85
```

# Files

Starter files have been provided in the 'starter_files' folder. `gradebook.rb` includes code to accept a filename on the command line, so you should be able to run `ruby gradebook.rb input1.csv` and see a report for `input1.csv`.

To run the tests to see if your code is correct, run `ruby gradebook_test.rb`.

[callout-download]

[/callout-download]

[callout-warning] The solutions are located in the 'solution' folder. Do not look at the solutions prior to completing the assignment. If you are stuck, move to the next exercise and then come back the the places where you had trouble. If you need help, consult with a peer first and only then look at the solution files for hints about how to proceed. [/callout-warning]
