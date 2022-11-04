namespace Sistema_de_hospedagem_de_um_hotel.models
{
  public class Suite
  {
    public Suite() { }

    public Suite(string tipoSuite, int capacidade, decimal valorDiaria)
    {
      TipoSuite = tipoSuite;
      Capacidade = capacidade;
      ValorDiaria = valorDiaria;
    }

    public string TipoSuite { get; set; }
    public int Capacidade { get; set; }
    public decimal ValorDiaria { get; set; }
  }
}