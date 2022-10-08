/*
====================================================
Bootcamp Pottencial .NET Developer 
====================================================
1/3 - Elemento majoritário
====================================================
DESAFIO:
Dado um array nums de tamanho n, retorne o elemento majoritário, isto é, o elemento
que aparece o maior número de vezes no seu array.

ENTRADA:
O arquivo de entrada consiste em um inteiro n que será validada caso esteja sob 
as condições do desafio.

SAÍDA:
A saída deverá retornar o número que aparece o maior número de vezes na sua array,
ou seja, o elemento majoritário.

Exemplo 1: 
-----------------------------------------------
| Exemplo de Entrada | Exemplo de Saída        |
-----------------------------------------------
| 3                  | 7                       | 
-----------------------------------------------
| 7                  |                         |
-----------------------------------------------
| 5                  |                         |
-----------------------------------------------
| 7                  |                         |
-----------------------------------------------

SOLUÇÃO ABAIXO:
*/

using System;
public class MeuPrograma
{
  public static void Main(String[] args)
  {
    int n = int.Parse(Console.ReadLine());
    int[] num = new int[n];
    // TODO: Crie as outras condições necessárias para a resolução do desafio:
    for (int i = 0; i < n; i++)
    {
      num[i] = int.Parse(Console.ReadLine());
    }
    Console.WriteLine(MajorityElement(num));
  }
  public static int MajorityElement(int[] nums)
  {
    int major = nums[0];
    int count = 1;

    for (int i = 0; i < nums.Length; i++)
    {
      if (major != nums[i])
      {
        major = nums[i];
        count = 1;
      }
      else
      {
        if (major == nums[i])
        {
          count++;
        }
        else
        {
          count--;
        }
      }
    }
    return major;
  }
}
