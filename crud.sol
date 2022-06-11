pragma solidity ^0.8.6;
contract taskContract{
    uint nextId;
    string status = "User deleted";

    struct User{
        uint id;
        string name;
        uint age;
        string nickname;
        bool conected;
    }

    User[] users;

    function createUser(string memory _name,uint _age , string memory _nickname, bool _conected) public{
        users.push(User(nextId, _name, _age ,_nickname, _conected));
        nextId++;
    }

    function findUserIndex(uint _id) internal view returns (uint) {
        for (uint i = 0 ; i < users.length; i++){
            if (users[i].id == _id){
                return i;
            }
        }
        revert ("User not found");
    }

    function readUser(uint _id) public view returns (uint, string memory, uint, string memory, bool) {
        uint index = findUserIndex(_id);
        return (users[index].id, users[index].name, users[index].age, users[index].nickname, users[index].conected);
    }

    function updateUser(uint _id, string memory _name, uint _age, string memory _nickname, bool _conected) public {
        uint index = findUserIndex(_id);
        users[index].name = _name;
        users[index].age = _age;
        users[index].nickname = _nickname;
        users[index].conected = _conected;
    }

    function deleteUser(uint _id) public returns (string memory) {
        uint index = findUserIndex(_id);
        delete users[index];
        return status;
    }
}