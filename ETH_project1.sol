// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.9;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables here
    string public token_Name = "LANEMORNE"; //Lanemorne is the name of our token
    string public token_Abbrv = "LMR"; //Our token has an abbreviation LMR
    uint public total_Supply = 0; //Initially the token supply will be 0 and it will increase as address are minted with these tokens

    string public A_Transaction_state; //will tell us that whether our transaction was success or not and if not then why


    // mapping variable here
    mapping(address => uint) public ownerBalance; /* Mapping in which our key is address of the owners and value is the amount 
                                                  they have in their respective accounts*/

    // mint function
    function mintToken(address _owner, uint _amount) public
    {
        //first we will increase the total supply to reflect it in the overall changes
        total_Supply += _amount; 

        //now we will increase or add the amount in the account balance of the respective owner
        ownerBalance[_owner] += _amount;  

        A_Transaction_state = "SUCCESSFULLY MINTED THE TOKENS"; 
    }

    // burn function
    function burnToken
    (address _owner, uint _amount) public
    {
        //first let us check that the amount to be burned is available in owner's account or not
        if(ownerBalance[_owner] >= _amount)
        {
        //first we will decrease the total supply to reflect it in the overall changes
        total_Supply -= _amount; 

        //now we will decrease or burn the amount in the account balance of the respective owner
        ownerBalance[_owner] -= _amount;

        A_Transaction_state = "SUCCESSFULLY BURNED"; // IF TRANSACTION IS SUCCESS
        }
        else
        {
            A_Transaction_state = "INSUFFICIENT BALANCE"; // IF TRANSACTION FAILS
        }   
    }

}
