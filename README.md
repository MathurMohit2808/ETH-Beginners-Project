# SMART CONTRACT

In this Solidity program there is an implementation of a smart contract which helps us to undertand how to create a token and then how to mint and burn the token amounts.

## Description

We have created a Dummy token which is basically an asset which is tokenized on a cryptocurrency. Then this token can be used or traded peer-to-peer and this smart contract works on it which makes it automated and smoother and also decentralized. Like the process of minting and then also the process of burning with particular conditions.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```javascript
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

    address[] public owners; //This is an array which will keep the track of addresses of owners


    // mapping variable here
    mapping(address => uint) public ownerBalance; /* Mapping in which our key is address of the owners and value is the amount 
                                                  they have in their respective accounts*/

    // mint function
    function mintToken(address _owner, uint _amount) public returns (string memory)
    {
        //first we will increase the total supply to reflect it in the overall changes
        total_Supply += _amount; 

        //now we will increase or add the amount in the account balance of the respective owner
        ownerBalance[_owner] += _amount;  

        return "SUCCESSFULLY MINTED THE TOKENS"; 
    }

    // burn function
    function burnToken
    (address _owner, uint _amount) public returns (string memory) /* we are using a return string to display whether the
                                                                the transaction is successful or not */
    {
        //first let us check that the amount to be burned is available in owner's account or not
        if(ownerBalance[_owner] > _amount)
        {
        //first we will decrease the total supply to reflect it in the overall changes
        total_Supply -= _amount; 

        //now we will decrease or burn the amount in the account balance of the respective owner
        ownerBalance[_owner] -= _amount;

        return "SUCCESSFULLY BURNED"; // IF TRANSACTION IS SUCCESS
        }
        else
        {
            return "INSUFFICIENT BALANCE"; // IF TRANSACTION FAILS
        }   
    }

}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" or more , and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the sayHello function. Click on the "HelloWorld" contract in the left-hand sidebar, and then click on the "sayHello" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello World!" message.

### Working of the code

First we have created a multiple variables of metadata for our token which will tell about its name, abbriviation and also how much token is supplied till now

later we are using the mapping to map the owner address as a key and the amount in the account is the value

then we have created a function mintToken which will increase the amount of token in both sections, balance of the owner and also the total supply

then we have created a function burnToken which will burn or delete a particular amount from the owner if it is available and then also from the total supply

