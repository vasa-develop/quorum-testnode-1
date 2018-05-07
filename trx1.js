a = eth.accounts[0]
web3.eth.defaultAccount = a;

// abi and bytecode generated from simplestorage.sol:
// > solcjs --bin --abi simplestorage.sol
var abi = [{"constant":true,"inputs":[{"name":"useraddr","type":"address"},{"name":"index","type":"uint256"}],"name":"getCard","outputs":[{"name":"cardType","type":"string"},{"name":"cardName","type":"string"},{"name":"name","type":"string"},{"name":"email","type":"string"},{"name":"addr","type":"string"},{"name":"mno","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"useraddr","type":"address"},{"name":"cardType","type":"string"},{"name":"cardName","type":"string"},{"name":"name","type":"string"},{"name":"email","type":"string"},{"name":"addr","type":"string"},{"name":"mno","type":"string"},{"name":"adhaarnumber","type":"string"}],"name":"AddCard","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"useraddr","type":"address"},{"name":"cardtype","type":"string"}],"name":"isCardPresent","outputs":[{"name":"index","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"useraddr","type":"address"},{"name":"index","type":"uint256"}],"name":"getCardAdhaarNumber","outputs":[{"name":"adhaarnumber","type":"string"}],"payable":false,"stateMutability":"view","type":"function"}];



var CoursetroContract = web3.eth.contract(abi);

var Coursetro = CoursetroContract.at('0x4dfe8a8621a053dc07911e834ed0eff6d1789f8e480d2f6eec6926ae06e90a7d');
console.log(Coursetro);

Coursetro.getCard('0x1158F15E74DCEc06AEAeEbA5b0EaA8461c73dB36',0,function(error, result){
            if(!error)
                {
                	console.log("RESULT:  ");
                    console.log(result);
                }
            else{
            	console.log("ERROR:  ");
                console.error(error);
            }
        });

        

