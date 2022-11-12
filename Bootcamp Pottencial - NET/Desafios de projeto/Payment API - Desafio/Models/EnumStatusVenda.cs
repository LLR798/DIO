using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;



namespace Payment_API___Desafio.Models
{
  public enum EnumStatusVenda
  {
    AguardandoPagamento,
    PagamentoAprovado,
    EnviadoParaTransportadora,
    Entregue,
    Cancelada
  }
}