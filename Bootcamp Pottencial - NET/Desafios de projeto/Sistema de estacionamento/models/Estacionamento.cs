namespace SistemaDeEstacionamento.Models
{
  public class Estacionamento
  {
    private decimal precoInicial = 0;
    private decimal precoPorHora = 0;
    private List<string?> veiculos = new List<string?>();

    public Estacionamento(decimal precoInicial, decimal precoPorHora)
    {
      this.precoInicial = precoInicial;
      this.precoPorHora = precoPorHora;
    }
    /// <summary>
    /// Adiciona um veículo no estacionamento
    /// </summary>
    public void AdicionarVeiculo()
    {
      Console.WriteLine("Digite a placa do veículo para estacionar:");
      veiculos.Add(Console.ReadLine());
    }
    /// <summary>
    /// Remove um veículo no estacionamento
    /// </summary>
    public void RemoverVeiculo()
    {
      Console.WriteLine("Digite a placa do veículo para remover:");

      string? placa = "";
      placa = Console.ReadLine();

      // Verifica se o veículo existe
      if (veiculos.Any(x => x!.ToUpper() == placa!.ToUpper()))
      {
        Console.WriteLine("Digite a quantidade de horas que o veículo permaneceu estacionado:");

        veiculos.Remove(placa);
        int horas = 0;
        decimal valorTotal = 0;

        horas = Convert.ToInt32(Console.ReadLine());
        valorTotal = (precoInicial + precoPorHora) * horas;

        Console.WriteLine($"O veículo {placa} foi removido e o preço total foi de: R$ {valorTotal}");
      }
      else
      {
        Console.WriteLine("Desculpe, esse veículo não está estacionado aqui. Confira se digitou a placa corretamente");
      }
    }
    /// <summary>
    /// Lista o(s) veículo(s) no estacionamento
    /// </summary>
    public void ListarVeiculos()
    {
      // Verifica se há veículos no estacionamento
      if (veiculos.Any())
      {
        Console.WriteLine("Os veículos estacionados são:");

        for (int contador = 0; contador < veiculos.Count; contador++)
        {
          Console.WriteLine($"Posição nº {contador + 1} - {veiculos[contador]}");
        }
      }
      else
      {
        Console.WriteLine("Não há veículos estacionados.");
      }
    }
  }
}
