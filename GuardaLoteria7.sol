pragma solidity >=0.4.22;

//struct

contract GuardaLoteria7 {
   
    address dono;
   
    struct Sorteio{
        uint data;
        uint numeroSorteado;
        address remetente;
       
   }
    Sorteio[] sorteios;
    
    constructor(uint numeroInicial) public {
        dono = msg.sender;
        set(numeroInicial);
    }
    
     function set(uint enviado) public{
         sorteios.push(Sorteio({
             data: now,
             numeroSorteado: enviado,
             remetente:msg.sender
         }));
    }
    
    function get() public view returns (
        address _donoDoContrado,
        uint _ultimoNumeroSorteado,
        address _ultimoRemetente) {
        
        Sorteio memory ultimo = sorteios[sorteios.length-1];
            
        return (dono,
                ultimo.numeroSorteado,
                ultimo.remetente);
    }
    
    function kill() public {
        require(dono==msg.sender,"Conta não é dona do contrato.");
        selfdestruct(msg.sender);
    }
}