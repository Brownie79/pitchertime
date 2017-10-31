pragma solidity ^0.4.15;

contract PitcherTIme{

    address owner; 
    address public currQuarterAddress;
    function PitcherTime(address _owner) public {
        //set owner to Pitcher
        owner = _owner;
    }
    
    function nextQuarter(uint students) public{
        address newQuarter = new Quarter(students);
        //pull aggregate data from old contract about how many tokens have been used, and how many quarters have passed
        currQuarterAddress = newQuarter;
    }

}

contract Quarter{
    uint256 MAXTOKENS = 125; // 1 Token = 15 minutes // Pitcher has 25 Officer Hours Per Quarter
    uint startOfQuarter;
    uint endOfQuarter;
    uint LENGTHOFQUARTER = 6652800; // 11 Weeks in SECONDS
    mapping(address => uint) tokensy; 
    uint studentsThisQuarter;

    
    function Quarter(uint _studentCount) public {
        startOfQuarter = now;
        endOfQuarter = startOfQuarter + LENGTHOFQUARTER;
        studentsThisQuarter = _studentCount; 
        
    }
    
    
}




contract Factory {
    bytes32[] Names;
    address[] newContracts;

    function createContract (bytes32 name) {
        address newContract = new Contract(name);
        newContracts.push(newContract);
    } 

    function getName (uint i) {
        Contract con = Contract(newContracts[i]);
        Names[i] = con.Name();
    }
}

contract Contract {
    bytes32 public Name;

    function Contract (bytes32 name) {
        Name = name;
    }
}