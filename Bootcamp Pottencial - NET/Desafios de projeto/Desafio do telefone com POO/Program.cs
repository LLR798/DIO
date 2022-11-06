using Desafio_do_telefone_com_POO.Models;

Iphone iphone = new Iphone("98999-9999" , "13 Pro", "IMEI IPHONE", 8);
Nokia nokia = new Nokia("97999-9999", "Lumia", "IMEI NOKIA", 6);

Console.WriteLine("Iphone:");
iphone.Ligar();
iphone.ReceberLigacao();
iphone.InstalarAplicativo("Whatsapp");

Console.WriteLine("Nokia");
nokia.Ligar();
nokia.ReceberLigacao();
nokia.InstalarAplicativo("Instagram");
