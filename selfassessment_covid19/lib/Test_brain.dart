import 'test.dart';

class CovTest {
  int _QNum = 0;
  List<Questions> _QData = [
    Questions(
        storyTitle:
            'In the past 14 days have you returned from a country with COVID-19 travel restrictions?',
        choice1: 'Yes',
        choice2: 'No'),
    Questions(
        storyTitle:
            'Have you had "close contact"?\nThis means you\'ve spent a prolonged time within 6 feet of someone who is a confirmed case of COVID-19.',
        choice1: 'Yes',
        choice2: 'No/Don\'t Know'),
    Questions(
        storyTitle:
            'Do you have an increased risk of complications?\nFor example,being older than 65, being pregnant, having chronic heart lung, or kidney conditions.',
        choice1: 'Yes',
        choice2: 'No'),
    Questions(
        storyTitle:
            'There\'s a good chance you\'re not infected, but please continue to practice precautions',
        choice1: 'Okay',
        choice2: ''),
    Questions(
        storyTitle:
            'Practice precautions strongly.\nWash your hands frequently, it contact to your face, and old large gathering',
        choice1: 'Okay',
        choice2: ''),
    Questions(
        storyTitle:
            'Home isolation ! \nYou need to quarantine yourself to minimize your potential chance of spreading the virus',
        choice1: 'Okay',
        choice2: ''),
    Questions(
        storyTitle:
            'Call your healthcare provider to let them know if you suspect you\'re carrying COVID-19',
        choice1: 'Okay',
        choice2: ''),
    Questions(
        storyTitle:
            'Monitor your condition \n if your symptoms get more and more severe, seek emergency help immediately',
        choice1: 'Okay',
        choice2: ''),
  ];
  getStory() {
    return (_QData[_QNum].storyTitle);
  }

  getChoice1() {
    return (_QData[_QNum].choice1);
  }

  getChoice2() {
    return (_QData[_QNum].choice2);
  }

  nextStory(int choice) {
    switch (_QNum) {
      case 0:
        if (choice == 1) {
          _QNum = 5;
        } else {
          _QNum = 1;
        }
        break;
      case 1:
        if (choice == 1) {
          _QNum = 5;
        } else {
          _QNum = 2;
        }
        break;
      case 2:
        if (choice == 1) {
          _QNum = 4;
        } else {
          _QNum = 3;
        }
        break;
      case 5:
        _QNum = 6;
        break;
      case 6:
        _QNum = 7;
        break;
      case 3:
      case 4:
      case 7:
        _QNum = 0;
    }
  }

  buttonVisible() {
    if (_QNum == 0 || _QNum == 1 || _QNum == 2) {
      return true;
    } else {
      return false;
    }
  }
}
