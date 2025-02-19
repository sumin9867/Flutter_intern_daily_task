# Project Report: Frontend Development of LoginPage

## Day 6: Assigned Task and Learning Progress

### Task Assigned:
For Day 6, I was assigned the task of developing the frontend of the LoginPage. This involved designing the user interface (UI) components such as text fields, buttons, and error messages to create an intuitive and visually appealing login screen.

### Learning Progress:
- **Clipper Widget**: I delved into the Clipper widget, which allowed me to create custom shapes and designs within containers. Specifically, I utilized it to create dynamic wave effects at the top of the login container, adding a visually engaging element to the UI.

```
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstControlPoint = Offset(size.width / 5, size.height - 70);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height + 10);
    var secondEndPoint = Offset(size.width, size.height - 70);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
```


- **Error Handling and Validation**: Implementing error handling and validation for text fields was a crucial aspect of the login form. By using the TextFormField widget and its built-in validation features, I ensured that users receive prompt feedback if they enter invalid data or leave required fields empty.

```
  validator: (value) =>
                    value!.length < 8 ? "Password must be at last 8" : null,
                showEyeIcon: true,
                focusNode: textbox2,
                textInputAction: TextInputAction.done,
```


- **TextFormField Widget**: Leveraging the TextFormField widget provided an efficient way to create text input fields with integrated validation and error handling capabilities. This streamlined the process of capturing user input while maintaining a clean and organized UI.

```
  child: TextFormField(
        validator: widget.validator,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        controller: widget.textEditingController,
        obscureText: widget.showEyeIcon ? _obscureText : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 182, 16, 16),
            ),
          ),
          labelText: widget.hintText,
          hintStyle: HintText.style,
          suffixIcon: widget.showEyeIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                )
              : null,
        ),
      ),

```

- **Design Themes**: I applied design themes to maintain consistency in the UI elements across the application. By defining a theme that specifies colors, fonts, and other visual attributes, I achieved a cohesive look and feel throughout the LoginPage.

- **Keyboard Handling with FocusNode**: Understanding how to manage keyboard focus using the FocusNode class was instrumental in improving the user experience. By assigning focus nodes to text fields and controlling the focus order, I facilitated seamless navigation through the form using keyboard shortcuts.
```
late FocusNode textbox1, textbox2, textbox3;

  @override
  void initState() {
    textbox1 = FocusNode();
    textbox2 = FocusNode();
    textbox3 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    textbox1.dispose();
    textbox2.dispose();
    textbox3.dispose();
    super.dispose();
  }
```

### Plan for Tomorrow:
- **Clarify Concepts**: I plan to delve deeper into the concepts of Clipper and FocusNode to gain a more comprehensive understanding. This will involve exploring advanced features and use cases to enhance my proficiency in these areas.
  
- **Code Refactoring**: I aim to improve the code quality and cleanliness by refactoring existing code and optimizing performance where necessary. This includes removing redundant code, improving variable naming conventions, and adhering to best practices.

- **Documentation**: Continuing with the project report, I will document my progress and learnings in Markdown format. This will serve as a valuable reference and aid in knowledge retention.

## Challenges Faced:
- **Initial Confusion**: I encountered some confusion while initially working with the Clipper and FocusNode widgets. However, through experimentation and research, I was able to overcome these challenges and gain a better understanding of their functionality.

- **Debugging**: Debugging and fixing errors in the code posed another challenge. However, with patience and thorough testing, I was able to identify and resolve the issues, leading to a more stable and reliable application.

## Conclusion:
Overall, Day 6 was productive and rewarding, with significant progress made in frontend development and widget comprehension. As I continue to refine the LoginPage and enhance my skills in Flutter development, I look forward to tackling new challenges and achieving further milestones in the project.
