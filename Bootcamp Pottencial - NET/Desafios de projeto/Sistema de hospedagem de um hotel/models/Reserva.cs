namespace Sistema_de_hospedagem_de_um_hotel.models
{
  public class Reserva
  {
    public List<Pessoa> Hospedes { get; set; }
    public Suite Suite { get; set; }
    public int DiasReservados { get; set; }

    public Reserva() { }

    public Reserva(int diasReservados)
    {
      DiasReservados = diasReservados;
    }

    public void CadastrarHospedes(List<Pessoa> hospedes)
    {
      // TODO: Verificar se a capacidade é maior ou igual ao número de hóspedes sendo recebido
      // *IMPLEMENTE AQUI*
      if (Suite.Capacidade >= hospedes.Count)
      {
        Hospedes = hospedes;
      }
      else
      {
        // Retorna uma exception caso a capacidade seja menor que o número de hóspedes recebido:
        throw new Exception("A capacidade da suíte é menor que o número de hóspedes. Favor escolher uma suíte que possua a mesma capacidade que números de hóspedes.");
      }
    }

    public void CadastrarSuite(Suite suite)
    {
      Suite = suite;
    }

    public int ObterQuantidadeHospedes()
    {
      // Retorna a quantidade de hóspedes:
      return Hospedes.Count;
    }

    public decimal CalcularValorDiaria()
    {
      // Retorna o valor da diária:
      decimal valor = DiasReservados * Suite.ValorDiaria;

      // Caso os dias reservados forem maior ou igual a 10, concede um desconto de 10%:
      if (DiasReservados >= 10)
      {
        // valor = (valor  * 0.1m);
        valor *= 0.9M;
      }
      return valor;
    }
  }
}