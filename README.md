# TableViewMVVM

### Application
Приложение получающие с сервера JSON - файл со списком данных нескольких типов и списком в каком порядке необходимо отобразить данные. При переходе отображается подробная информация о данных содержащихся в блоке.

### Preview App
<img src="https://github.com/VitKhryapin/TableViewMVVM/blob/main/Preview/Preview1.png" width="150"> <img src="https://github.com/VitKhryapin/TableViewMVVM/blob/main/Preview/Preview2.png" width="150"> <img src="https://github.com/VitKhryapin/TableViewMVVM/blob/main/Preview/Preview3.png" width="150"> <img src="https://github.com/VitKhryapin/TableViewMVVM/blob/main/Preview/preview4.png" width="150">

### Functionality
+ использован архитектурный паттерн MVVM
+ использован FactoryPattern для создания ячеек таблицы
+ в приложении один экран и одна таблица, которая изменяется при измении данных и их типа (реализованно для отработки Factory)
+ в блоке "selector" реализован выбор только одного объекта
+ в блоке "picture" использована сторонняя библиотека для подгрузки изображений SDWebImage

### Stack
+ Swift.
+ UIKit.
+ MVVM.
+ FactoryPattern.
+ XIB.
+ Auto Layout.
+ URLSession.
+ Codable.
+ SDWebImage.



