pragma solidity >=0.4.22 <0.6.0;

//Visibilidade de funções, modifier e event

contract GuardaLoteria4 {
    uint numeroSorteado;
    address dono;
    uint contadorDeSorteios = 0;
    bool donoRico = false;
    
    constructor(uint numeroInicial) public{
        require (msg.sender.balance > 99.99999999999 ether);
        
        numeroSorteado = numeroInicial;
        dono = msg.sender;
        contadorDeSorteios = 1;
        
        if (msg.sender.balance > 20 ether){
            donoRico = true;
        }
        else {
            donoRico = false;
        }
    }
    
     event TrocoEnviado(address pagador, uint troco);
     
     function set(uint enviado) public payable comCustoMinimo(1000) {
        numeroSorteado = enviado;
        contadorDeSorteios ++;
        
        if (msg.value > 1000){
            uint troco = msg.value - 1000;
            msg.sender.transfer(troco);
            emit TrocoEnviado(msg.sender,troco);
        }
    }
    modifier comCustoMinimo(uint min){
        require(msg.value >= min,"Não foi enviado Ether suficiente.");
        _;
    }
    
    function get() public view returns (uint) {
        return numeroSorteado;
    }
    
    /*function get() internal view returns (uint) {
        return numeroSorteado;
    }*/
}