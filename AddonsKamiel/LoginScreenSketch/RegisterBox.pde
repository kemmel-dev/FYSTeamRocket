

class RegisterBox extends Box
{

    private static final String textToDisplay = "Register";

    public RegisterBox(PVector position, int w, int h)
    {
        super(position, w, h);
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
        // databaseManager.submitUserID(userID);
        print(userID);
    }
}