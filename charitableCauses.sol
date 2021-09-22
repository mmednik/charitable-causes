pragma solidity ^0.8;

contract charitableCauses {
    
    struct charitableCause {
        uint id;
        string name;
        uint goalAmount;
        uint collectedAmount;
    }
    
    uint causes_count = 0;
    
    mapping (string => charitableCause) causes;
    
    
    // Create new charitable cause
    
    function newCause (string memory _name, uint _goalAmount) public {
        
        causes_count++;
        charitableCause memory _cause = charitableCause(causes_count, _name, _goalAmount, 0);
        causes[_name] = _cause;
        
    }
    
    
    // Goal reached checker
    
    function goalReached(string memory _name, uint _amount) private view returns(bool) {
        
        bool flag = false;
        charitableCause memory _cause = causes[_name];
        
        if(_cause.goalAmount >= (_cause.collectedAmount + _amount)) {
            flag = true;
        }
        
        return flag;
        
    }
    
    
    // Donate to a cause
    
    function donate(string memory _name, uint _amount) public returns(bool) {
        
        bool donation_accepted = true;
        
        if(goalReached(_name, _amount)) {
            causes[_name].collectedAmount += _amount;
        } else {
            donation_accepted = false;
        }
        
        return donation_accepted = false;
        
    }
    
    
    // Check collected amount
    
    function getCollectedAmount(string memory _name) public view returns(bool, uint) {
        
        bool goal_reached = false;
        charitableCause memory _cause = causes[_name];
        
        if(_cause.collectedAmount >= _cause.goalAmount) {
            goal_reached = true;
        }
        
        return(goal_reached, _cause.collectedAmount);
    }
}
