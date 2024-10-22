import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String yourName = "";
  String partnerName = "";

  String getTheRelationShip(List<String> flames, length) {
    final findRemoveLetter = length % flames.length;
    final local = [...flames];
    local.removeAt(
        findRemoveLetter == 0 ? flames.length - 1 : findRemoveLetter - 1);
    if (flames.length == 1) {
      return flames.join('');
    }
    return getTheRelationShip(local, length);
  }

  void showRelationShip(String result) {
    String title = "";
    String message = "";
    // String gifpath = "";
  

    switch (result) {
      case "f":
        title = "Friendship 🫂";
        message = "You both are good friends!";
        // gifpath = "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExN2hxczV3ZjFram5vaWMyam4zazUxYnA1djU1a2dhN3NsdHhzaWs5aCZlcD12MV9naWZzX3NlYXJjaCZjdD1n/VduFvPwm3gfGO8duNN/giphy.gif";
        break;

      case "l":
        title = "Love ❤️";
        message = "You both are in love!";
        // gifpath = "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMzg5OTJzcHFwbHJsOGlobHJ6MXMxOHBpOHM3b3A4NDBlb2QycW1kbiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/9G0AdBbVrkV3O/giphy.gif";
        break;

      case "a":
        title = "Affection 😍";
        message = "You have a strong affection for your partner!";
        // gifpath = "https://media.giphy.com/media/2f8o25IQOfxbI6ghkP/giphy.gif?cid=ecf05e4757m5z7l3y2uedsau0ushuym1hwn7eb1dk6twj8t4&ep=v1_gifs_search&rid=giphy.gif&ct=g";
        // gifpath = "https://giphy.com/gifs/cute-couple-1427cjQy7kiBS8";
        break;

      case "m":
        title = "Marriage 💑";
        message = "Your are destined to marry your partner!";
        // gifpath = "https://media.giphy.com/media/d42fBz7HHxLS2gDVsy/giphy.gif?cid=ecf05e47w6yx9naukbcqzddf2drmw09hw52imp1xi16o1q5k&ep=v1_gifs_search&rid=giphy.gif&ct=g";
        // // gifpath =
            // "https://giphy.com/gifs/i-love-you-ring-chun-jiao-jiu-zhi-ming-xUNd9YLYU4jMFPFwly";
        break;

      case "e":
        title = "Enemies 👿";
        message = "You both are enemies!";
        // gifpath = "https://media.giphy.com/media/scNXcGIBkKfzexPDGu/giphy.gif?cid=ecf05e476unc4e5zxt1405imr4t70porqvdi2ojv51ciped0&ep=v1_gifs_search&rid=giphy.gif&ct=g";

        // gifpath =
        //     "https://giphy.com/gifs/cartoon-evil-tom-and-jerry-yrCoPHxEtDlq8";
        break;

      case "s":
        title = "Siblings 💞";
        message = "You both share a sibling-like bond!";
        // gifpath = "https://media.giphy.com/media/TK4HjonbbxyQcXR9ub/giphy.gif?cid=ecf05e47nferwojxjjhbthgzi1ajdyfms5zan58q3h9g7zzo&ep=v1_gifs_search&rid=giphy.gif&ct=g";
        break;
      default:
        title = "Unknown";
        message = "Could not determine the relationship";
    }

   
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.network(gifpath),
            const SizedBox(height: 10),
            Text(message),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Ok'),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
//  void deepak(){
//   if(yourName == "deepak"){
//     showRelationShip("l");
//     return;
//   }
//  }
  
      
    
    

  void find() {


    if (yourName.isEmpty || partnerName.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Please enter both names."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Ok'),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }
    
      if(yourName=="deepak"){
        showRelationShip("l");
        return;
      }

      if(yourName=="maran" && partnerName != "legidha"){
        showRelationShip("s");
        return;
      }

      if(yourName=="maran"&& partnerName=="legidha"){
        showRelationShip("m");
        return;
      }

    
      

    List<String> longestName =
        (yourName.length > partnerName.length ? yourName : partnerName)
            .toLowerCase()
            .split("");
    List<String> shortestName =
        (yourName.length < partnerName.length ? yourName : partnerName)
            .toLowerCase()
            .split("");

    final local = [...longestName];
    for (var singleCharacter in local) {
      if (shortestName.contains(singleCharacter)) {
        longestName.remove(singleCharacter);
        shortestName.remove(singleCharacter);
      }
    }
    final totalLengthOfName = longestName.length + shortestName.length;
    List<String> flames = ["f", "l", "a", "m", "e", "s"];
    final ans = getTheRelationShip(flames, totalLengthOfName);
    showRelationShip(ans);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("FLAMES"),
      ),
      body:Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
      
      
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           TextField(
              onChanged: (value) {
                yourName = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
          ),
          const SizedBox(height: 20),
         TextField(
              onChanged: (value) {
                partnerName = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Partner Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              find();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text("Find"),
          ),
        ],
      ),
      )
      ),
    );
  }
}
