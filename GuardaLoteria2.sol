pragma solidity >=0.4.22 <0.6.0;

contract GuardaLoteria2 {
    uint numeroSorteado;
    
    constructor(uint numeroInicial) public{
        
        numeroSorteado = numeroInicial;
    }

    function set(uint enviado) public {
        numeroSorteado = enviado;
    }
    
    function get() public view returns (uint) {
        return numeroSorteado;
    }
}