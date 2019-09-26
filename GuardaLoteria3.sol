ragma solidity >=0.4.22 <0.6.0;

contract GuardaLoteria3 {
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
     function set(uint enviado) public {
        numeroSorteado = enviado;
        contadorDeSorteios ++;
    }
    
    function get() public view returns (uint) {
        return numeroSorteado;
    }
    
    function getContador() public view returns (uint) {
        return contadorDeSorteios;
    }
    
    function getDono() public view returns (address) {
        return dono;
    }
    function getDonoRico() public view returns (bool){
        return donoRico;
    }
    
}