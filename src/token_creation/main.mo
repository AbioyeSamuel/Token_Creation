import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor Token {

  let owner : Principal = Principal.fromText("kidqb-6oip3-vgcg6-yhhnn-i4qju-ryi6a-o6gb4-3wby7-pmjmh-yyvwz-cqe");
  // Total supply of token set to set to 1,000,000
  let totalSupply : Nat = 1000000;
  let symbol : Text = "DSAMUEL";

  private stable var balanceEntries : [(Principal, Nat)] = [];
  private var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
  if (balances.size() < 1) {
    balances.put(owner, totalSupply);
  };
    
  public query func balanceOf(who: Principal) : async Nat {

    let balance : Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };
       Debug.print(debug_show(balance));
       
    return balance;
  };

  public query func getSymbol() : async Text {
    Debug.print(symbol);
    return symbol;
  };

};



