import 'package:dio/dio.dart';

class CoreService {
  Dio dio = Dio();
  late Response response;
  String baseurl = "https://rideshare.devscape.online/api/v1";
}






/*

https://rideshare.devscape.online/api/v1/auth/register


{
  "message": "Create new account done successfully",
  "status": "CREATED",
  "localDateTime": "2024-08-02T12:49:58.782797",
  "body": {
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTQ5NzU4NTkxIiwiaWF0IjoxNzIyNTkyMTk4LCJleHAiOjE3MjI2Nzg1OTh9.X6t4mDMtGD0SGCgB88lub6A2_KGygERtbOb62o9PQWg"
  }
}

*/


// curl -X 'POST' \
//   'https://rideshare.devscape.online/api/v1/auth/register' \
//   -H 'accept: */*' \
//   -H 'Content-Type: application/json' \
//   -d '{
//   "firstName": "enas",
//   "lastName": "ghobaes",
//   "phone": "0949758591",
//   "username": "enas",
//   "birthDate": "2024-08-02",
//   "password": "Stringstring12@",
//   "confirmPassword": "Stringstring12@"
// }'



// login
/*
/api/v1/auth/authenticate
*/

//rigester
// /api/v1/auth/register