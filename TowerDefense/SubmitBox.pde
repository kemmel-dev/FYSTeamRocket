/**
 * A SubmitBox inherits from Box.
 * It is used to submit information or a selection.
 * @see Box
 * @author Kamiel de Visser | 500838438
 */
class SubmitBox extends Box
{

    // The text to display on the submit button
    private static final String textToDisplay = "Submit";

    /**
    * Constructor function for a SubmitBox object.
    * @param position the position of this submitbox as a PVector
    * @param w the width of this box
    * @param h the height of this box
    */
    public SubmitBox(PVector position, int w, int h)
    {
        // Calls Box'es constructor function
        super(position, w, h);
    }

    /**
    * Shows the submitbox
    */
    public void display()
    {
        // Calls Box'es display function
        super.display();

        fill(style.textColor);
        textSize(style.textSize);
        text(textToDisplay, position.x - 135, position.y + 40 );
    }

    /**
    * Submits a name
    */
    public void submitName(String name)
    {
        scoreList.add(0, new Pair<Integer, String>(statistics.scorePoints, name));
    }
}