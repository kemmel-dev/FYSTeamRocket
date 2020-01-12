class NewUserBox extends Box
{
    private static final String textToDisplay = "New User";

    public SubmitBox(PVector position, int w, int h, DatabaseManager databaseManager)
    {
        super(position, w, h);
        this.databaseManager = databaseManager;
    }

    public void display()
    {
        super.display();
        fill(style.textColor);
        textSize(style.textSize);
        text(textToDisplay, position.x, position.y - h / 16);
    }

    public void submitUserID(String userID)
    {
        databaseManager.submitUserID(userID);
    }
}