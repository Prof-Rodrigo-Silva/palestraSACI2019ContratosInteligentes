pragma solidity >=0.4.22;

//Array, selfdestruct

contract GuardaLoteria6 {
    uint numeroSorteado = 0;
    address dono;
    uint contadorDeSorteios = 0;
    
    uint[] numerosSorteados;
    
    constructor(uint numeroInicial) public payable comCustoMinimo(1000){
        dono = msg.sender;
        set(numeroInicial);
    }
    
     event TrocoEnviado(address pagador, uint troco);
     
     function set(uint enviado) public payable comCustoMinimo(1000) {
        numeroSorteado = enviado;
        contadorDeSorteios ++;
        numerosSorteados.push(enviado);
        
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
    
    function get() public view returns (
        address _donoDoContrado,
        uint _ultimoNumeroSorteado,
        uint _contadorDeSorteios,
        uint _saldoEmWei,
        uint[] memory _todosNumerosSorteados) {
        
        uint ultimo = numerosSorteados[contadorDeSorteios-1];
            
        return (dono,
                ultimo,
                contadorDeSorteios,
                address(this).balance,
                numerosSorteados);
    }
    
    function kill() public {
        require(dono==msg.sender,"Conta não é dona do contrato.");
        selfdestruct(msg.sender);
    }
}