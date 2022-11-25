# http_library

Мини Http Request Library

Приложение выводит 
 - код статуса запроса;
 - описание статуса  
   * в зеленом если код статуса 200, 
   * в коричневом если статус 400,  
   * в оранжевом если статус 401,
   * в янтарьном если статус 403,
   * в красном если статус 404,
   * в желтом если статус 500.
   
 Примечание!!!
 В задание условие для метода sendRequest:
 sendRequest(string url, string method, array parameters, array headers,
 string format): void
 
 В имлементации изменено как:
 sendRequest(string url, string method, Map<> parameters, Map<> headers,
 string format): Future<HttpResModel>
 

Некоторые Тестовые Url адреса находятся по ссылке:
 https://documenter.getpostman.com/view/8165175/2s8YsnXGAL

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
