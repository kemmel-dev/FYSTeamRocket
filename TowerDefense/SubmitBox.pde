class SubmitBox extends Box
{

    private static final String textToDisplay = "Submit";

    public SubmitBox(PVector position, int w, int h)
    {
        super(position, w, h);
    }

    public void display()
    {
        super.display();
        fill(style.textColor);
        textSize(style.textSize);
        text(textToDisplay, position.x - 135, position.y + 40 );
    }

    public void submitName(String name)
    {
        scoreList.add(0, new Pair<Integer, String>(statistics.scorePoints, name));
    }
}