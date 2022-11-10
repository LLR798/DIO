using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Desafio_API_dotnet.Models;


namespace Desafio_API_dotnet.Context
{
  public class OrganizadorContext : DbContext
  {
    public OrganizadorContext(DbContextOptions<OrganizadorContext> options) : base(options)
    {

    }

    public DbSet<Tarefa> Tarefas { get; set; }
  }
}