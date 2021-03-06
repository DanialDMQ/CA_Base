import java.util.*;

//You can use enum for more than two states
//In this case 1 represents green and 0 represents black
enum Color {
    GREEN,
    BLACK
}

class CA {

    //Length of each cell
    private int sizeOfCell = 20;

    private int columns, rows;

    public boolean autoGenerate = false;

    //Array saves each generation
    private ArrayList<int[][]> generations = new ArrayList<int[][]>();

    private int generationIndex = 0;

    private int lastGenerationIndex = 0;

    //The board that is shown
    private int[][] board;


    //Constructor
    public CA() {
        this.columns = width/this.sizeOfCell;
        this.rows = height/this.sizeOfCell;
        this.board = new int[this.rows][this.columns];
        this.init();
        // this.IC();
    }


    private void lastGeneratoin() {
        if (this.generationIndex > this.lastGenerationIndex)
            this.lastGenerationIndex = this.generationIndex;
    }


    //Initialize the board randomly
    public void init() {
        for (int i = 0; i < this.rows; i++)
            for (int j = 0; j < this.columns; j++)
                this.board[i][j] = int(random(2));

        this.generations.add(board);
    }


    private void IC() {
        //Implement your desired initial condition and run it instead of init()

        this.generations.add(board);
    }


    public void generate() {
        //Implement your rules and generate a new generation

        this.generations.add(board);
        this.generationIndex++;
        this.lastGeneratoin();
    }


    public void previousGeneration() {
        if (this.generationIndex > 0)
            this.board = this.generations.get(--generationIndex);
    }


    public void nextGeneration() {
        if (this.generationIndex < this.lastGenerationIndex)
            this.board = this.generations.get(++generationIndex);

        else if (this.generationIndex == this.lastGenerationIndex)
            this.generate();
    }


    public void display() {
        //Display the board
        for ( int i = 0; i < rows;i++) {
            for ( int j = 0; j < columns;j++) {
                if ((board[i][j] == 1))
                    fill(76, 187, 23);
                else
                    fill(1);
                stroke(1);
                rect(j*this.sizeOfCell, i*this.sizeOfCell, this.sizeOfCell, this.sizeOfCell, 60, 60, 60, 60);
            }
        }
        //Display the generation index
        fill(167, 0, 167);
        textAlign(CENTER);
        textSize(40);
        text(this.generationIndex, width/2 - 10, 30);
    }
}

