package tests;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import workout.Builder;

/**
 *
 * @author JDTobiason
 */
public class BuilderTests {
    
    @Test
    public void checkReturnWorkoutsUpper() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "Moderate";
        String equ = "1";
        String workouts[] = {"Upper Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "1");
    }
    
    @Test
    public void checkReturnWorkoutsLower() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "Moderate";
        String equ = "1";
        String workouts[] = {"Lower Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "12");
    }
    
    @Test
    public void checkReturnWorkoutsCore() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "Moderate";
        String equ = "1";
        String workouts[] = {"Core"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.size(), 0);
    }
    
    @Test
    public void checkReturnWorkoutsUpperLow() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "Low";
        String equ = "1";
        String workouts[] = {"Upper"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.size(), 0);
    }
    
    @Test
    public void checkReturnWorkoutsUpperHigh() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "High";
        String equ = "1";
        String workouts[] = {"Upper"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.size(), 0);
    }
    
        @Test
    public void checkReturnWorkoutsCoreLow() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "Low";
        String equ = "1";
        String workouts[] = {"Core"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.size(), 0);
    }
    
    @Test
    public void checkReturnWorkoutsCoreHigh() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "High";
        String equ = "1";
        String workouts[] = {"Core"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.size(), 0);
    }
    
    @Test
    public void checkReturnWorkoutsLowerLow() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "Low";
        String equ = "1";
        String workouts[] = {"Lower Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "47");
    }
    
    @Test
    public void checkReturnWorkoutsLowerHigh() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "1";
        String wInt = "High";
        String equ = "1";
        String workouts[] = {"Lower Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "45");
    }
    
    @Test
    public void checkReturnWorkoutsLowerConditioning() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "0";
        String wInt = "Moderate";
        String equ = "1";
        String workouts[] = {"Lower Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "13");
    } 
    
    @Test
    public void checkReturnWorkoutsCoreConditioning() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "0";
        String wInt = "Moderate";
        String equ = "1";
        String workouts[] = {"Core"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "7");
    } 
    
    @Test
    public void checkReturnWorkoutsUpperConditioning() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "0";
        String wInt = "Moderate";
        String equ = "1";
        String workouts[] = {"Upper Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "2");
    } 
    
    @Test
    public void checkReturnWorkoutsUpperConditioningNoEquip() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "0";
        String wInt = "Moderate";
        String equ = "0";
        String workouts[] = {"Upper Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.size(), 0);
    } 
    
    @Test
    public void checkReturnWorkoutsLowerConditioningNoEquip() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "0";
        String wInt = "Moderate";
        String equ = "0";
        String workouts[] = {"Lower Body"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "37");
        for (int i = 0; i < workoutFields.size();i++) {
            System.out.println(workoutFields.get(i));
        }
    } 
    
    @Test
    public void checkReturnWorkoutsCoreConditioningNoEquip() {
        ArrayList<String> workoutFields = new ArrayList<String>();
        String wType = "0";
        String wInt = "Moderate";
        String equ = "0";
        String workouts[] = {"Core"};
        workoutFields = Builder.returnExercises(wType, wInt, equ, workouts);
        assertEquals(workoutFields.get(0), "7");
        for (int i = 0; i < workoutFields.size();i++) {
            System.out.println(workoutFields.get(i));
        }
    }
    
    /*public BuilderTests() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }*/

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
