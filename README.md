# Курсовой проект
### [![Build Status](https://travis-ci.org/amirnyy/applicationforbackupfrominstagram.svg?branch=master)](https://travis-ci.org/amirnyy/applicationforbackupfrominstagram)
> Данный проект просвещен разработке и созданию приложения, которое поможет простому пользователю скачать фото и видеоматериалы в лучшем качестве и разрешении с аккаунтов сервиса Instagram. Мы вложили много сил и знаний чтобы реализовать эту идею и теперь, когда мы смогли это сделать, можно спокойно говорить, что приложение жизнеспособно и выполняет поставленные перед ним задачи.
## Приложение для резервного копирования данных
Консольное приложение для резервного копирования фото и видеоматериалов с Instagram
## Информация по использованию приложения
Для использования данного приложения потребуется ваш API от аккаунта Instagram
### ![1 v7gyjq_4lykfdzof9q17ea](https://user-images.githubusercontent.com/45944636/50238512-a2beb980-03d0-11e9-822e-75f4e612b630.jpeg)
## Описание 

Нам удалось реализовать поставленную перед нами задачу, а именно резервное копирование данных с сервиса Instagram. Наше приложение может скачивать фото и видеоматериалы с аккаунтов пользователей которые получили доступ к API. Качество и разрешение фото и видеоматериалов остаётся высоким и пользователь сможет наслаждаться скаченными файлами.

## Компоненты приложения
Компоненты приложения включают в себя: файлы исходного кода и библиотеку Foudation с классами библиотеки: 
- NSData  
- NSJSONSerialization
- NSURL
- NSString 
- NSArray 
- NSDictionary
### Требования 
- Xcode 9.0+
- macOS 10.11+ 

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
### Что можно еще реализовать в будущем

При получения полного доступа к Instagram API, любой пользователь может скачать нужные ему материалы с любого публичного аккаунта сервиса Instagram, а при прохождении аутификацию пользователь сможет скачивать фото и видеоматериалы с закрытого аккаунта.
## Лицензия
Данный проект находится под лицензией [MIT](https://ru.wikipedia.org/wiki/Лицензия_MIT)
