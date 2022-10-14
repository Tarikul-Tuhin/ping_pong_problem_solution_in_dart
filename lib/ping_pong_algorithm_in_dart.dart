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
  List listWithIntegarAndDecimal = [];
  List listWithDecimalOnly = [];
  Map allItems = {};
  int singleCount = 0;
  int doubleCount = 0;
  List finalResult = [];

  List allList = [
    [9, 10],
    [9, 12],
    [14, 15],
    [16, 18],
    [14, 18],
    [10, 13],
    [15, 18],
    [10, 14],
    [9, 13]
  ];
  for (int i = 0; i < allList.length; i++) {
    num sum = allList[i][0];
    for (num j = allList[i][0];
        j <= allList[i][allList[i].length - 1];
        j = j + 0.5) {
      listWithIntegarAndDecimal.add(sum);
      sum = sum + 0.5;
    }
  }

//   print(listWithIntegarAndDecimal);
  for (int i = 0; i < listWithIntegarAndDecimal.length; i++) {
    // Removing decimal value which has zero at the end.
    listWithIntegarAndDecimal[i] % 1 == 0
        ? listWithIntegarAndDecimal[i] = listWithIntegarAndDecimal[i].toInt()
        : listWithIntegarAndDecimal[i] = listWithIntegarAndDecimal[i];
  }

  for (int i = 0; i < listWithIntegarAndDecimal.length; i++) {
    if (listWithIntegarAndDecimal[i].runtimeType == double) {
      listWithDecimalOnly.add(listWithIntegarAndDecimal[i]);
    }
  }

//   print(listWithDecimalOnly);
  for (int i = 0; i < listWithDecimalOnly.length; i++) {
    allItems[listWithDecimalOnly[i]] = 0;
  }

  for (int i = 0; i < listWithDecimalOnly.length; i++) {
    allItems.forEach((key, value) {
      if (key == listWithDecimalOnly[i]) {
        allItems[key]++;
      }
    });
  }

  // print(allItems);

  allItems.forEach((key, value) {
    if (value >= 2 && value < 4) {
      singleCount = singleCount + 1;
    } else if (value >= 4) {
      doubleCount = doubleCount + 1;
    }
  });

  finalResult = [singleCount, doubleCount];
  print(finalResult);
}
