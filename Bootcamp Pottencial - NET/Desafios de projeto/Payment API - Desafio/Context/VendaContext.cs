using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Payment_API___Desafio.Models;



namespace Payment_API___Desafio.Context
{
  public class VendaContext : DbContext
  {
    public VendaContext(DbContextOptions<VendaContext> options) : base(options)
    { 

    }

    public DbSet<Venda> Vendas { get; set; }
  }
}