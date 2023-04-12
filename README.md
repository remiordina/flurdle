# Wordle Flutter App Workshop

This workshop will guide you through the process of creating a Wordle game using Flutter in 90 minutes. We will use Atomic Design to structure our project folders.

## Prerequisites* (optional)

Before starting the workshop, make sure you have the following software installed on your machine:

- Flutter SDK
- Android Studio or Visual Studio Code with Flutter and Dart plugins
- Emulator or physical device for testing

(*) **During the workshop we will make use of the FlutLab online code editor, so no prerequisites are needed.**

## Getting Started

To get started, clone or download the starter code from the workshop repository. Open the code in your preferred IDE and run the following command in the terminal:

```flutter pub get```


This will install all the required packages and dependencies for the project.

## Atomic Design Folder Structure

We will be using the Atomic Design methodology to structure our project folders. The Atomic Design methodology is a popular approach to design systems that involves breaking down UI elements into smaller, reusable components. Here's an overview of the folder structure:

- **presentation**
    - **atoms** - contains the smallest UI elements, such as buttons and icons.
    - **molecules** - contains UI elements composed of one or more atoms, such as forms and input fields.
    - **organisms** - contains UI elements composed of one or more molecules, such as headers and footers.
    - **templates** - contains reusable page templates composed of organisms and molecules.
    - **pages** - contains the final app pages composed of templates, organisms, molecules, and atoms.
- **models** - contains the models.
- **main.dart** - the entry point of the application.

## Wordle Game

The Wordle game is a guessing game where the player has to guess a five-letter word within six attempts. The game will display the letters of the word as blanks, and the player has to guess the letters and their positions.

## Workshop Steps

During the workshop, we will follow these steps:

1. Create the folder structure using Atomic Design.
2. Create the game layout using UI elements.
3. Implement the logic for generating and checking the word.
4. Create the functionality for player input.
5. Display the results of the game.

By the end of the workshop, you will have a working Wordle game built using Flutter and the Atomic Design methodology.

## Conclusion

This workshop will give you a hands-on experience of building a real-world app using Flutter and Atomic Design. If you have any questions or feedback, feel free to reach out to us. Happy coding!
