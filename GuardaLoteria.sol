pragma solidity >=0.4.22 <0.6.0;

contract GuardaLoteria {
    uint numeroSorteado;

    function set(uint _enviado) public {
        numeroSorteado = _enviado;
    }
    
    function get() public view returns (uint) {
        return numeroSorteado;
    }
}