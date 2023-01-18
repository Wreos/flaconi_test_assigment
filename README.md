# Flaconi test assigment
Test task for Flaconi

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Autotests are written using
- Flutter
- Dart

## Pre-conditions

Install flutter 
https://docs.flutter.dev/get-started/install

Check that everything is okay with flutter-doctor

```sh
flutter doctor
```

## Launching tests
Go to the test directory

* Run ALL the tests 

```sh
flutter test integration_test
```

* Run specific test

```sh
flutter test integration_test/TEST_NAME.dart
```

DEMO
Android


https://user-images.githubusercontent.com/15965366/213170658-71112d3d-fc50-4b13-97a3-80ce579e60d7.mp4



iOS

https://user-images.githubusercontent.com/15965366/213170631-939dc8fd-4952-4c32-a032-5befd03b9ddf.mp4


# PS
* I didn't use the page object, since the application is quite simple and the use of the pattern looks like an overhead
* Also, to improve the stability of tests, it worth to think about adding mocks to tests, but as it is test-assigment, I limited myself not do it in scope of MVP
