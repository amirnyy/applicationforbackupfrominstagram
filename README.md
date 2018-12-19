# Курсовой проект
### [![Build Status](https://travis-ci.org/amirnyy/applicationforbackupfrominstagram.svg?branch=master)](https://travis-ci.org/amirnyy/applicationforbackupfrominstagram)
## Приложение для резервного копирования данных
Консольное приложение для резервного копирования фото и видеоматериалов с Instagram
### ![1 v7gyjq_4lykfdzof9q17ea](https://user-images.githubusercontent.com/45944636/50238512-a2beb980-03d0-11e9-822e-75f4e612b630.jpeg)
## Сборка проекта и запуск
### Первый способ (при наличии XcodeCommandLineTools)
```ShellSession
$ git clone https://github.com/amirnyy/applicationforbackupfrominstagram
$ cd applicationforbackupfrominstagram/examples
$ xcodebuild -project 'App for backup instagram.xcodeproj' -alltargets
$ cd build/Release
$ ./'App for backup instagram'
```
### Второй способ  (через clang)
```ShellSession
$ git clone https://github.com/amirnyy/applicationforbackupfrominstagram
$ cd applicationforbackupfrominstagram/examples/'App for backup instagram'
$ clang -framework Foundation main.m -o 'App for backup instagram'
$ ./'App for backup instagram'
```
## Лицензия
Данный проект находится под лицензией [MIT](https://ru.wikipedia.org/wiki/Лицензия_MIT)
