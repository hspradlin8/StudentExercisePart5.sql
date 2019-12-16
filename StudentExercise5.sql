using StudentExercise5.Models;
using System;
using System.Collections.Generic;

namespace StudentExercise5
{
    class Program
    {
        private static IEnumerable<Instructors> allInstructors;

        static void Main(string[] args)
        {
            var exerciseRepo = new Repository();
            var allExercises = exerciseRepo.GetAllExercises();

            //get all exercises

            Console.WriteLine("All Exercises");
            Console.WriteLine("------------------");
            foreach (Exercise ex in allExercises)
            {
                Console.WriteLine(ex.ExerciseName);
            }

            
            //get all JS exercises

            List<Exercise> allJavaScriptExercises = exerciseRepo.getAllJavaScriptExercises("JavaScript");

            foreach (Exercise ex in allJavaScriptExercises)
            {
                Console.WriteLine($"{ex.Id}: {ex.ExerciseName}");
            }

           
            // get all instructors 

            Console.WriteLine("Get all the instructors");

            var Instructors = exerciseRepo.GetAllInstructors();

            foreach (Instructors inst in Instructors)
            {
                Console.WriteLine($"{inst.Id} {inst.FirstName} {inst.LastName}, {inst.SlackHandle}, {inst.Specialty}, {inst.CohortName} {inst.CohortId}");
            }

           
            //Insert a new instructor into the database. Assign the instructor to an existing cohort..

            Console.WriteLine("Insert a new instructor into the database.");
           
            Instructors instructor = new Instructors
            {
        
                FirstName = "Madi",
                LastName = "Peper",
                SlackHandle = "MadiP",
                CohortId = 4,
                Specialty = "Rock Climbing",
                CohortName = "Cohort 35"

            };

            exerciseRepo.AddInstructor(instructor);

            //Assign an existing exercise to an existing student.

            //Console.WriteLine("Enter student id to choose student");
            //var studentById = Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Enter exercise id to choose student");
            //var exerciseById = Convert.ToInt32(Console.ReadLine());
            //AddExercise(studentById, exerciseById);



            var assignExercise = new StudentExercises();
            Console.WriteLine("Student Id:");
            Console.Write(">");
            assignExercise.StudentId = int.Parse(Console.ReadLine());
            Console.WriteLine("Exercise Id:");
            Console.Write(">");
            assignExercise.ExerciseId = int.Parse(Console.ReadLine());
            exerciseRepo.GetAllStudents(assignExercise);

        }


       
    }
}
