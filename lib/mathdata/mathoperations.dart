class Mathoperations{
  static int doOperation(int v1, int v2, int op){
    var operations=["+","*","-","/"];
    switch(op){
      case 0:
        return v1+v2;
      case 1:
        return v1*v2;
      case 2:
        return v1-v2;
      case 3:
        return v2~/v1;
    }
    return v1+v2;
  }
}