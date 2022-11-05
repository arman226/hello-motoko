import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"

actor DBank{
    stable var currentValue: Float = 300; //using stable for persistency
    // currentValue := 200;
    let id =43242423;
    stable var startTime = Time.now();
    // Debug.print(debug_show(id));

    public func topUp(amount:Float){
        currentValue+=amount;
        Debug.print(debug_show(currentValue))


    };

    public func withdraw(amount:Float){
        let tempValue:Float = currentValue-amount;
            if(tempValue>=0){
                currentValue-=amount;
                Debug.print(debug_show(currentValue)); 
                return;
            };
            Debug.print("No more Balance");
    };

//query
    public query func checkBalance(): async Float{
         Debug.print(debug_show(currentValue));
         return currentValue
    };

    public func compound(){
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime; //time elapsed in nanoseconds
        let timeElapsedS = timeElapsedNS /1000000000; //time elapsed in seconds
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); 
        startTime := currentTime;
    }
}