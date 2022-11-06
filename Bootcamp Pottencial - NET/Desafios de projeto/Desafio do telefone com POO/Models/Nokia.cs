namespace Desafio_do_telefone_com_POO.Models
{
  public class Nokia : Smartphone
  {
    public Nokia(string numero, string modelo, string imei, int memoria) : base(numero, modelo, imei, memoria)
    {

    }
    public override void InstalarAplicativo(string nomeApp)
    {
      Console.WriteLine($"{nomeApp} instalado da PlayStore");
    }
  }
}