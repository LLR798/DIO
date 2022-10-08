/*
==========================================================
Bootcamp Pottencial .NET Developer 
==========================================================
1/3 - Subtraindo o produto e a soma de um número inteiro
==========================================================
DESAFIO:
Dado um número inteiro ( n ) , retorne a diferença entre o produto de seus dígitos e a soma de seus dígitos.

ENTRADA:
A entrada consiste em um número inteiro ( n );

SAÍDA:
A saída consiste na multiplicação do produto dos dígitos ( n ), a soma de seus dígitos e a diferenção entre o produto e a soma, como no exemplo a baixo: 

-----------------------------------------------
| Exemplo de Entrada | Exemplo de Saída       |
-----------------------------------------------
| 100 2 2            | 25.00                  |
-----------------------------------------------
| 200 3 8            | 18.18                  |
-----------------------------------------------

SOLUÇÃO ABAIXO:
*/

using System;

class DIO {
        
static void Main(string[] args){

        int n = int.Parse(Console.ReadLine());
        int p = 1, s = 0;
        while (n > 0){
             int l = n % 10;
// TODO: Crie as outras condições necessárias para a resolução do desafio:
             p *= l;
             s += l;
             n /= 10;
           }

           Console.WriteLine(p-s);
        }
    }
