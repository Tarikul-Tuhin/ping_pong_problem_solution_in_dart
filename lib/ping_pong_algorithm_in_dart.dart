/*
Problem: Table Tennis Room So, we have ping pong room for pastime.  
But ping pong needs either two players or four players.  
We want to know how many hours people could enjoy ping pong  as singles or doubles in a day. 
Sample data: [start time, end time] ← available time to play ping pong. 
Condition: working hour is 9-18,  
Ping pong table is only one. 
case 1: [[9,10], [9,12]]. Ans: singles 1 hour, doubles 0 hours. 
case 2: [[9,13],[11,15],[10,16],[17,18],[11,18]]. Ans: singles 5 hour, doubles 2 hours.  
*/

void main() {
  PingPong p1 = PingPong();
  print(p1.pingPongCalculate([9, 13], [11, 15], [10, 16], [17, 18], [11, 18]));
}

class PingPong {
  List updateListofP1 = [];
  List updateListofP2 = [];
  List updateListofP3 = [];
  List updateListofP4 = [];
  List updateListofP5 = [];
  List allSortedList = [];
  Map allItems = {};
  int singleCount = 0;
  int doubleCount = 0;
  List finalResult = [];

  List pingPongCalculate(List p1, p2, p3, p4, p5) {
    calcualtionFunc(p1, p2, p3, p4, p5) {
// ----- Adding middle values inside the given list provided by the user so that I can compare with the common element between 2 items ----Starts------
      //First ListCalculation
      List p1Update = [];
      num p1FirstElement = p1[0];

      for (num i = p1[0]; i <= p1[p1.length - 1]; i = i + 0.5) {
        p1Update.add(p1FirstElement);
        p1FirstElement = p1FirstElement + 0.5;
      }
      for (int i = 1; i < p1Update.length; i = i + 2) {
        updateListofP1.add(p1Update[i]);
      }

      //Second ListCalculation
      List p2Update = [];
      num p2FirstElement = p2[0];

      for (num i = p2[0]; i <= p2[p2.length - 1]; i = i + 0.5) {
        p2Update.add(p2FirstElement);
        p2FirstElement = p2FirstElement + 0.5;
      }

      for (int i = 1; i < p2Update.length; i = i + 2) {
        updateListofP2.add(p2Update[i]);
      }

      //Third ListCalculation
      List p3Update = [];
      num p3FirstElement = p3[0];

      for (num i = p3[0]; i <= p3[p3.length - 1]; i = i + 0.5) {
        p3Update.add(p3FirstElement);
        p3FirstElement = p3FirstElement + 0.5;
      }

      for (int i = 1; i < p3Update.length; i = i + 2) {
        updateListofP3.add(p3Update[i]);
      }

      //Fourth ListCalculation
      List p4Update = [];
      num p4FirstElement = p4[0];

      for (num i = p4[0]; i <= p4[p4.length - 1]; i = i + 0.5) {
        p4Update.add(p4FirstElement);
        p4FirstElement = p4FirstElement + 0.5;
      }
      for (int i = 1; i < p4Update.length; i = i + 2) {
        updateListofP4.add(p4Update[i]);
      }

      //Fifth ListCalculation
      List p5Update = [];
      num p5FirstElement = p5[0];

      for (num i = p5[0]; i <= p5[p5.length - 1]; i = i + 0.5) {
        p5Update.add(p5FirstElement);
        p5FirstElement = p5FirstElement + 0.5;
      }
      for (int i = 1; i < p5Update.length; i = i + 2) {
        updateListofP5.add(p5Update[i]);
      }

// ----- Adding middle values inside the given list provided by the user so that I can compare with the common element between 2 items ----Ends------

      // --------------- Coverting into Map Starts -----------
      for (int i = 0; i < updateListofP1.length; i++) {
        allItems[updateListofP1[i]] = 0;
        allSortedList.add(updateListofP1[i]);
      }

      for (int i = 0; i < updateListofP2.length; i++) {
        allItems[updateListofP2[i]] = 0;
        allSortedList.add(updateListofP2[i]);
      }

      for (int i = 0; i < updateListofP3.length; i++) {
        allItems[updateListofP3[i]] = 0;
        allSortedList.add(updateListofP3[i]);
      }
      for (int i = 0; i < updateListofP4.length; i++) {
        allItems[updateListofP4[i]] = 0;
        allSortedList.add(updateListofP4[i]);
      }

      for (int i = 0; i < updateListofP5.length; i++) {
        allItems[updateListofP5[i]] = 0;
        allSortedList.add(updateListofP5[i]);
      }

      // --------------- Coverting into Map Ends -------------

      for (int i = 0; i < allSortedList.length; i++) {
        allItems.forEach((key, value) {
          if (key == allSortedList[i]) {
            allItems[key]++;
          }
        });
      }

      print(allItems);

      allItems.forEach((key, value) {
        if (value >= 2 && value < 4) {
          singleCount++;
        } else if (value >= 4) {
          doubleCount++;
        }
      });
    }

    if (p1.isNotEmpty &&
        p2.isNotEmpty &&
        p3.isNotEmpty &&
        p4.isNotEmpty &&
        p5.isNotEmpty) {
      calcualtionFunc(p1, p2, p3, p4, p5); //Calling the function

    }

    finalResult = [singleCount, doubleCount];

    return finalResult;
  }
}
