# Flutter Flip Card Widget

This repository contains a highly customizable and easy-to-use Flutter widget that implements a flip card animation.

## Overview

The Flip Card widget is developed using Flutter's animation and state management capabilities. It employs the `AnimationController` class to control the flip animations and uses `SingleTickerProviderStateMixin` to provide ticks for the animation controller.

The widget has a front and a back view, both of which are containers with some beautiful gradients. When you click on the widget, it flips over revealing the other side. This effect is achieved using the `TweenSequence` class for front and back animations. The card flip is initiated using a `GestureDetector`, making the card responsive to user input.

## Usage

Simply import the provided `flip_card.dart` file in your Flutter project and use the `FlipCard` widget. The card's appearance and dimensions can be customized as required.

## Demo

Here's a quick demo of the Flip Card widget in action:

![Demo](./Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-06-18%20at%2009.55.48.mp4)

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
