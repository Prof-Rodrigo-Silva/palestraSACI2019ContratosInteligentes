pragma solidity >=0.4.22 <0.6.0;

//Variáveis

contract GuardaLoteria5 {
    int8 numero;
    bool numeroImpar;
    bool numeroPar;
    
    constructor(int _numero) public payable{
        set(_numero);
    }
    
     function set(int _numero) public {
        //require(_numero == int8(_numero),"Valor não cabe na variável global");
        numero = int8(_numero);
        
        numeroPar = numero % 2 == 0;
        numeroImpar = !numeroPar;
        
    }
    
    function get() public view returns (int8 _numero, bool _ePar, bool _eImpar) {
        return (numero, numeroPar, numeroImpar);
    }
    
}